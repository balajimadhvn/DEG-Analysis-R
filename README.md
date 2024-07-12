# DEG-Analysis-R
Explore and visualize differentially expressed genes (DEGs) from RNA-seq data using R. Includes scripts for generating volcano plots, MA plots, heatmaps, and more.
# RNA-seq Differential Expression Analysis

This repository contains R scripts to visualize differentially expressed genes (DEGs) from RNA-seq data.

## Files

- `plot_DEGs.R`: R script to generate plots for DEGs including volcano plots, MA plots, heatmap plots, and gene expression plots.
- `data/deg_data.csv`: Example dataset containing DEG information (Gene, Log2FC, PValue, FDR, Expression1, Expression2).

## Usage

1. Clone this repository to your local machine.
2. Open `plot_DEGs.R` in RStudio or any R environment.
3. Run the script to generate plots based on the example data provided (`data/deg_data.csv`).

## Plot Descriptions

- **Volcano Plot**: Visualizes fold change vs. statistical significance of DEGs.
- **MA Plot**: Shows the relationship between two sets of expression data.
- **Heatmap Plot**: Displays gene expression levels across samples.
- **Gene Expression Plot**: Illustrates expression distribution for each gene.

## Requirements

- R (version X.X.X)
- Required R packages: `ggplot2`, `ggrepel`, `pheatmap`

Feel free to customize the script with your own DEG data or modify plot aesthetics as needed.
