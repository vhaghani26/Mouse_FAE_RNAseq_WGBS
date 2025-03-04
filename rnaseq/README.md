# RNA-seq Analysis

Note that all numerical labels preceding scripts and directories are reflective of the order that things were run. Some directories are not in the GitHub repository due to the fact that those directories contained sequence data that are inappropriate to host on GitHub. However, you can access all the raw data using the information below and associated scripts in this repository.

## Sample Information

The following SRA IDs correspond to the samples used for the RNA-seq study. All data is paired-end.

|     SRA ID     |   Original Sample Name   |        Treatment        | Dam | Pup |   Sex   |
|:--------------:|:------------------------:|:-----------------------:|:---:|:---:|:-------:|
| SRR32332085    |         G1_1_1_4        |         Control         |  1  |  4  | Female  |
| SRR32332084    |         G1_1_1_5        |         Control         |  1  |  5  | Female  |
| SRR32332077    |         G1_1_1_6        |         Control         |  1  |  6  | Male    |
| SRR32332076    |         G1_1_1_7        |         Control         |  1  |  7  | Male    |
| SRR32332075    |         G1_1_2_4        |         Control         |  2  |  4  | Male    |
| SRR32332074    |         G1_1_2_5        |         Control         |  2  |  5  | Female  |
| SRR32332073    |         G1_1_2_6        |         Control         |  2  |  6  | Female  |
| SRR32332072    |         G2_2_6_5        |    Folic Acid Excess    |  6  |  5  | Female  |
| SRR32332071    |         G2_2_6_6        |    Folic Acid Excess    |  6  |  6  | Female  |
| SRR32332070    |         G2_2_6_7        |    Folic Acid Excess    |  6  |  7  | Male    |
| SRR32332083    |         G2_2_6_8        |    Folic Acid Excess    |  6  |  8  | Male    |
| SRR32332082    |        G2_2_7_10        |    Folic Acid Excess    |  7  | 10  | Male    |
| SRR32332081    |        G2_2_7_11        |    Folic Acid Excess    |  7  | 11  | Female  |
| SRR32332080    |         G2_2_7_7        |    Folic Acid Excess    |  7  |  7  | Female  |
| SRR32332079    |         G2_2_7_8        |    Folic Acid Excess    |  7  |  8  | Female  |
| SRR32332078    |         G2_2_7_9        |    Folic Acid Excess    |  7  |  9  | Female  |


## 1. Processing Raw Data

Sample names were stored in the [`samples.yml`](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/rnaseq/samples.yml) configuration file. This was read into the [`Snakefile`](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/rnaseq/Snakefile), which conducted the following processes:

1. Copying the genome annotation file (`Mus_musculus_Ensemble_107_new.gtf.gz`) and fasta file (`mmEnsemble107.fa`) to the working directory
2. Indexing the genome using STAR
3. Screening raw data against other genomes (hg19, hg38, Lambda, mm10, PhiX, rheMac10, rn6) to confirm there is no sample contamination
4. Trimming raw data
5. Aligning trimmed reads using STAR (which also outputs gene counts)
6. Confirming sample sex (this was incorporated at a later point, corresponding to the [`08_sex_checker.sh`](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/rnaseq/08_sex_checker.sh) script)
7. Conducting a quality control step for all raw and processed data

## 2. DEG Analysis

Differentially expressed genes (DEGs) were identified using [`05_DEG_Analysis.ipynb`](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/rnaseq/05_DEG_Analysis.ipynb). Gene ontology (GO) analysis was conducted with [`05_DEG_GO.ipynb`](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/rnaseq/05_DEG_GO.ipynb).


## 3. WGCNA Analysis

Whole genome correlation network analysis (WGCNA) was conducted with [`06_WGCNA.ipynb`](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/rnaseq/06_WGCNA.ipynb) and the associated GO analysis was conducted with [`07_WGCNA_GO.ipynb`](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/rnaseq/07_WGCNA_GO.ipynb).

## 4. Visualization of Results

DEG results were visualized using [`08_Visualize_DEG.ipynb`](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/rnaseq/08_Visualize_DEG.ipynb) and WGCNA results were visualized using [`08_Visualize_WGCNA.ipynb`](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/rnaseq/08_Visualize_WGCNA.ipynb).

## Software Information

All software versions for the data processing can be found [here](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/RNAseq_conda_environment.yml), and the software and associated versions for visualization can be found [here](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/visualization_conda_environment.yml). 