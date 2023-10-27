# Clustering Analysis of Microbial Samples Based on Environmental Variables Using K-Means Algorithm


In this report, I will present the results of a clustering analysis of microbial samples based on environmental variables using the k-means algorithm. The data set consists of four variables: oxygen, pH, salinity, and temperature, measured for 100 samples. The goal of the analysis is to find the optimal number of clusters that group the samples based on their similarity in the environmental variables, and to visualize and compare the clusters. The growth and activity of these microorganisms depend on several environmental factors, such as temperature, pH, salinity, and oxygen level. These factors affect the metabolism, enzyme function, membrane structure, and gene expression of the microorganisms. The data were randomly generated.

## Data Preparation 

```R
# Loading Packages
library(readr)
library(ggplot2)
library(ggthemes)
library(reshape2)
library(ggforce)

# Importing data
data <- read_csv("data.csv")
```






Phylogenetic tree is a graphical representation of the evolutionary relationships among different organisms or sequences based on their similarities and differences.

In this project, we aim to compare the phylogeny of some streptococcus species of bacteria, which are gram-positive cocci that cause various infections in humans and animals. We have downloaded the fasta files of the 16S rRNA sequences of four streptococcus species from the NCBI database, using their accession numbers. The 16S rRNA sequences are widely used for bacterial identification and phylogenetic analysis, as they contain conserved and variable regions that reflect the evolutionary relationships among different taxa. We will use R and some Bioconductor packages to perform multiple sequence alignment, distance calculation, and phylogenetic tree construction and visualization.

<H2> Result </H2>
<img src="https://github.com/sulovekoirala/Bioinformatics/blob/main/IMG/Phylogenetic%20Tree.svg">

Additionally, you can customize the trees into various shapes and designs using the [ggtree package](https://github.com/YuLab-SMU/ggtree) 


