#!/bin/bash
#
#SBATCH --job-name=dmrichr_kostas
#SBATCH --mail-user=vhaghani@ucdavis.edu
#SBATCH --ntasks=70 # Number of cores/threads
#SBATCH --mem=500000 # Ram in Mb
#SBATCH --partition=production 
#SBATCH --time=2-00:00:00 
#SBATCH --mail-type=ALL
#SBATCH --chdir=/share/lasallelab/Viki/epigenerator/08_cytosine_reports/

###################
# Run Information #
###################

start=`date +%s`

hostname

THREADS=${SLURM_NTASKS}
MEM=$(expr ${SLURM_MEM_PER_CPU} / 1024)

echo "Allocated threads: " $THREADS
echo "Allocated memory: " $MEM

################
# Load Modules #
################

# Run aklog to deal with SLURM bug
aklog

# Source your config file so conda can be used (likely .profile, could be .bashrc)
source ~/.profile

# Activate the conda environment
conda activate /share/lasallelab/programs/.conda/DMRichR_R4.2

########
# DM.R #
########

# Run with defaults

call="Rscript \
--vanilla \
/share/lasallelab/programs/DMRichR/DM_R4.2.R \
--genome mm10 \
--coverage 1 \
--perGroup '0.50' \
--minCpGs 5 \
--maxPerms 10 \
--maxBlockPerms 10 \
--cutoff '0.10' \
--testCovariate Group \
--adjustCovariate Sex \
--sexCheck TRUE \
--GOfuncR TRUE \
--EnsDb FALSE \
--cellComposition FALSE \
--cores 20"

echo $call
eval $call

###################
# Run Information #
###################

end=`date +%s`
runtime=$((end-start))
echo $runtime
