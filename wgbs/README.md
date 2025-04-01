# WGBS Analysis

Note that all numerical labels preceding scripts and directories are reflective of the order that things were run. Some directories are not in the GitHub repository due to the fact that those directories contained sequence data that are inappropriate to host on GitHub. However, you can access all the raw data using the information below and associated scripts in this repository.

## Sample Information

The following SRA IDs correspond to the samples used for the WGCNA study. All data is paired-end. Specified samples were excluded from analysis due to failure of raw data to align to the reference genome. However, software continues to improve and a previous study I worked on reanalyzed data with alignment problems and succeeded, so I'm optimistic that this data will be of use one day.

| SRA ID     | Original Sample Name |        Treatment        | Dam | Pup |   Sex   | Excluded From Analysis |
|:----------:|:--------------------:|:-----------------------:|:---:|:---:|:-------:|:----------------------:|
| SRR32924785 |        FA114        |         Control         |  1  |  4  | Female  |           -            |
| SRR32924784 |        FA115        |         Control         |  1  |  5  | Female  |           -            |
| SRR32924793 |        FA116        |         Control         |  1  |  6  | Male    |           -            |
| SRR32924792 |        FA117        |         Control         |  1  |  7  | Male    |           -            |
| SRR32924791 |        FA124        |         Control         |  2  |  4  | Male    |           -            |
| SRR32924790 |        FA125        |         Control         |  2  |  5  | Female  |           -            |
| SRR32924789 |        FA126        |         Control         |  2  |  6  | Female  |           -            |
| SRR32924788 |        FA265        |    Folic Acid Excess    |  6  |  5  | Female  |           -            |
| SRR32924787 |        FA266        |    Folic Acid Excess    |  6  |  6  | Female  |           -            |
| SRR32924797 |        FA267        |    Folic Acid Excess    |  6  |  7  | Male    |          Yes           |
| SRR32924796 |        FA268        |    Folic Acid Excess    |  6  |  8  | Male    |          Yes           |
| SRR32924786 |       FA2710        |    Folic Acid Excess    |  7  | 10  | Male    |           -            |
| SRR32924783 |       FA2711        |    Folic Acid Excess    |  7  | 11  | Female  |           -            |
| SRR32924798 |        FA277        |    Folic Acid Excess    |  7  |  7  | Female  |           -            |
| SRR32924795 |        FA278        |    Folic Acid Excess    |  7  |  8  | Female  |          Yes           |
| SRR32924794 |        FA279        |    Folic Acid Excess    |  7  |  9  | Female  |          Yes           |

## 1. Processing Raw Data

The [`epigenerator`](https://github.com/vhaghani26/epigenerator) pipeline was used to process the raw data and generate cytosine reports:

1. [`01_FASTQ_Me2.py`](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/wgbs/01_FASTQ_Me2.py) was used to merge and organize raw sequence data from different lanes
2. [`02_CpG_Me2_PE`](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/wgbs/02_CpG_Me2_PE) processed the data by doing the following:
	1. Trimming raw data
	2. Screening raw data against other genomes (hg19, hg38, Lambda, mm10, PhiX, rheMac10, rn6) to confirm there is no sample contamination
	3. Aligning data to the mm10 genome via Bismark
	4. Deduplicating data via Bismark
	5. Sorting data with Picard
	6. Calculating insert size metrics and nucleotide coverage
	7. Extracting methylation data
	8. Generating a cystosine report per sample
	9. Conducting a quality control step for all raw and processed data
	
## 2. `DMRichR` DMR Analysis

Differentially methylated regions (DMRs) were identified by reading Cytosine reports into DMRichR using [`DMRichR_Kostas_SexCombined.slurm`](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/wgbs/00_slurm/DMRichR_Kostas_SexCombined.slurm). This uses the software package [`DMRichR`](https://github.com/ben-laufer/DMRichR).

## 3. `Comethyl` Comethylated Region Analysis

To determine regions (i.e. modules) that are comethylated, cytosine reports were read in and used in the following scripts in the specified order:

1. [`01_Kostas_Comethyl.R`](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/wgbs/Comethyl_Results/01_Kostas_Comethyl.R)
2. [`02_Kostas_Comethyl.ipynb`](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/wgbs/Comethyl_Results/02_Kostas_Comethyl.ipynb)

This uses the software package [`Comethyl`](https://github.com/cemordaunt/comethyl).

## Software Information

All software versions for the data processing can be found [here](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/WGBS_conda_environment.yml), and the software and associated versions for visualization can be found [here](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/visualization_conda_environment.yml). 