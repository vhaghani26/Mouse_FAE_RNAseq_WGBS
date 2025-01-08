#!/bin/bash

# Working directory
bam_dir="/share/lasallelab/Viki/2023_KZ_RNAseq/mouse/03_bam_files"

# Subset BAM files to only X and Y chromosomes
samples=("G1_1_1_4" "G1_1_1_5" "G1_1_1_6" "G1_1_1_7" "G1_1_2_4" "G1_1_2_5" "G1_1_2_6" "G2_2_6_5" "G2_2_6_6" "G2_2_6_7" "G2_2_6_8" "G2_2_7_10" "G2_2_7_11" "G2_2_7_7" "G2_2_7_8" "G2_2_7_9")

for sample in "${samples[@]}"
do
    # Subset BAM file for X and Y chromosomes
    samtools view -b "${bam_dir}/${sample}_Aligned.sortedByCoord.out.bam" X Y > "${bam_dir}/${sample}_chrXY.bam"
    
    # Index the subsetted BAM file
    samtools index "${bam_dir}/${sample}_chrXY.bam"
done

# Calculate coverage statistics from samtools indexed files
coveragestats() {
    samtools idxstats "$1" 2>/dev/null | awk '{print $1, $3}' 2>/dev/null
}

# Determine sex for each sample using BAM files
for bam_file in "$bam_dir"/*_chrXY.bam; do
    # Extract sample name from the BAM file name
    sample=$(basename "$bam_file" _chrXY.bam)
    
    # Calculate coverage statistics
    xcov=$(coveragestats "$bam_file" | awk '$1=="X"{print $2}')
    ycov=$(coveragestats "$bam_file" | awk '$1=="Y"{print $2}')
    total_xy_reads=$(coveragestats "$bam_file" | awk '$1=="X" || $1=="Y" {sum+=$2} END{print sum}')
    
    # Check if X and Y coverage information is available
    if [ -n "$xcov" ] && [ -n "$ycov" ]; then
        # Calculate ratios
        x_to_y_ratio=$(echo "scale=2; $xcov / $ycov" | bc)
        y_to_x_ratio=$(echo "scale=2; $ycov / $xcov" | bc)
        
        # Calculate proportion of reads from X and Y chromosomes
        proportion_x=$(echo "scale=5; ($xcov / $total_xy_reads) * 100" | bc)
        proportion_y=$(echo "scale=5; ($ycov / $total_xy_reads) * 100" | bc)

        # Determine suspected sex
        suspected_sex=""
        if (( $(echo "$proportion_y >= 1" | bc -l) )); then
            suspected_sex="Male"
        else
            suspected_sex="Female"
        fi

        # Output result
        echo "$sample:"
        echo "     X: $xcov"
        echo "     Y: $ycov"
        echo "     Proportion of Reads from X: $proportion_x%"
        echo "     Proportion of Reads from Y: $proportion_y%"
        echo "     X/Y Ratio: $x_to_y_ratio"
        echo "     Y/X Ratio: $y_to_x_ratio"
        echo "     Suspected Sex: $suspected_sex"
    else
        echo "Coverage statistics for $sample are missing. Cannot determine sex."
    fi
done



