# MirBird

Tentative project for microRNA identification with online-available genomes of birds

## Requirements

First, create conda environment named "mirbird"

```
conda create -name mirbird
source activate mirbird
```

Second, download required software packages and update existing packages.

Two major software package used are:

NCBI Genome Downloading Scripts
https://github.com/kblin/ncbi-genome-download

MirMachine
https://github.com/sinanugur/MirMachine

```
conda install -c bioconda ncbi-genome-download
conda install mirmachine -c bioconda -c conda-forge
```

## Selection of bird species

From Genbank, we can select bird genomes with good quality to cover most of the bird families. 


## Running script looping across selected bird species (underconstruction.sh)

The script loops across selected bird species. For each species, the script:

1. Downloads and unzips the genome from Genbank.
2. Identify possible microRNA from the genome using MirMachine.
3. Extracts the results and deletes the genome and intermidiate files.
