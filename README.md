# Excess prenatal folic acid supplementation alters cortical gene expression networks and electrophysiology

## Citation

## Raw Data

All raw data associated with the study can be found under BioProject Accession Number **PRJNA1223393**. There were two treatment groups, each containing pups from the litters born from two dams. The WGBS and RNA-seq analyses were performed using samples from the same mice (i.e. the samples in each row are paired).

| WGBS SRA ID | WGBS Sample Name | RNA-seq SRA ID | RNA-seq Sample Name |        Treatment        | Dam | Pup |   Sex   |
|:-----------:|:----------------:|:---------------:|:--------------------:|:-----------------------:|:---:|:---:|:-------:|
| SRR32924785 |       FA114     |   SRR32332085   |        G1_1_1_4      |         Control         |  1  |  4  | Female  |
| SRR32924784 |       FA115     |   SRR32332084   |        G1_1_1_5      |         Control         |  1  |  5  | Female  |
| SRR32924793 |       FA116     |   SRR32332077   |        G1_1_1_6      |         Control         |  1  |  6  | Male    |
| SRR32924792 |       FA117     |   SRR32332076   |        G1_1_1_7      |         Control         |  1  |  7  | Male    |
| SRR32924791 |       FA124     |   SRR32332075   |        G1_1_2_4      |         Control         |  2  |  4  | Male    |
| SRR32924790 |       FA125     |   SRR32332074   |        G1_1_2_5      |         Control         |  2  |  5  | Female  |
| SRR32924789 |       FA126     |   SRR32332073   |        G1_1_2_6      |         Control         |  2  |  6  | Female  |
| SRR32924788 |       FA265     |   SRR32332072   |        G2_2_6_5      |    Folic Acid Excess    |  6  |  5  | Female  |
| SRR32924787 |       FA266     |   SRR32332071   |        G2_2_6_6      |    Folic Acid Excess    |  6  |  6  | Female  |
| SRR32924797 |       FA267     |   SRR32332070   |        G2_2_6_7      |    Folic Acid Excess    |  6  |  7  | Male    |
| SRR32924796 |       FA268     |   SRR32332083   |        G2_2_6_8      |    Folic Acid Excess    |  6  |  8  | Male    |
| SRR32924786 |      FA2710     |   SRR32332082   |        G2_2_7_10     |    Folic Acid Excess    |  7  | 10  | Male    |
| SRR32924783 |      FA2711     |   SRR32332081   |        G2_2_7_11     |    Folic Acid Excess    |  7  | 11  | Female  |
| SRR32924798 |       FA277     |   SRR32332080   |        G2_2_7_7      |    Folic Acid Excess    |  7  |  7  | Female  |
| SRR32924795 |       FA278     |   SRR32332079   |        G2_2_7_8      |    Folic Acid Excess    |  7  |  8  | Female  |
| SRR32924794 |       FA279     |   SRR32332078   |        G2_2_7_9      |    Folic Acid Excess    |  7  |  9  | Female  |


## RNA-seq

For more information regarding how the RNA-seq data was analyzed, please see the [README.md](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/tree/main/rnaseq/README.md) file under the `rnaseq` directory.

## WGBS

For more information regarding how the WGBS data was analyzed, please see the [README.md](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/tree/main/wgbs/README.md) file under the `wgbs` directory.

## RNA-seq and WGBS Integration

The analysis integrating the RNA-seq and WGBS data and assessing the significance of the overlapping regions is detailed in the [`01_RNAseq_WGBS_integration.ipynb`](https://github.com/vhaghani26/Mouse_FAE_RNAseq_WGBS/blob/main/01_RNAseq_WGBS_integration.ipynb) script.