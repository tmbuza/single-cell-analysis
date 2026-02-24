# Single-Cell Analysis (Free Track)

This repository is part of the **Complex Data Insights (CDI)** applied bioinformatics series.

It provides a structured, reasoning-focused introduction to single-cell RNA-seq analysis using R and Quarto.

The goal is not to teach button-click workflows.

The goal is to build interpretation discipline.

---

## What This Guide Covers

The free track walks through the conceptual reasoning chain:

Data structure  
→ QC metrics  
→ Normalization  
→ Dimensionality reduction  
→ Clustering  
→ Marker evidence  
→ Calibrated biological claims  

Each lesson builds on the previous one.

Later steps do not override earlier ones.

---

## Repository Structure

```
single-cell-analysis/
│
├── _quarto.yml
├── index.qmd
├── 01-preface-and-setup.qmd
├── 02-data-structure-and-qc-metrics.qmd
├── 03-normalization-and-feature-selection.qmd
├── 04-dimensionality-reduction-and-clustering.qmd
├── 05-marker-genes-and-annotation.qmd
├── 06-from-clusters-to-biological-claims.qmd
│
├── assets/
│   └── css/
│
├── scripts/
│   └── R/
│       ├── cdi-plot-theme.R
│       └── cdi-single-cell-simulate-data.R
│
├── data/
│
└── docs/
```

---

## Demo Data

The free track uses lightweight simulated single-cell data to ensure:

- Fast rendering
- Reproducibility
- Clear interpretation examples

To generate demo data:

```r
source("scripts/R/cdi-single-cell-simulate-data.R")
```

This creates:

- `data/demo-counts.csv`
- `data/demo-metadata.csv`

---

## Rendering the Guide

From the project root:

```bash
quarto render
```

Rendered output is written to:

```
docs/
```

---

## Deployment

This repository is configured to deploy via GitHub Pages.

If the custom domain is configured, the guide will be available at:

```
https://singlecell.complexdatainsights.com
```

---

## Interpretation Philosophy

Single-cell analysis is vulnerable to over-interpretation because:

- Cells are not independent biological replicates
- Clusters are algorithmic groupings
- Marker genes are not exclusive labels
- Batch effects can resemble biology

This guide repeatedly separates:

- What the analysis shows
- What the analysis suggests
- What the analysis cannot prove

That separation is the core skill.

---

## Position in CDI Ecosystem

This repository is part of the CDI applied bioinformatics series alongside:

- RNA-seq analysis
- GWAS analysis

All guides follow consistent structural and interpretation standards.

---

## License

Educational use only.  
See repository settings for licensing details.
