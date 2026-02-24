# CDI Single-Cell Simulated Data Generator
# Domain: Single-Cell Free Track
# Purpose: Create lightweight demo counts + metadata for teaching

set.seed(123)

# Parameters
n_genes <- 500
n_cells <- 300
n_cell_types <- 3
n_batches <- 2

# Gene names
genes <- paste0("Gene", seq_len(n_genes))

# Add mitochondrial genes
mt_genes <- paste0("MT-Gene", seq_len(20))
genes[1:20] <- mt_genes

# Cell metadata
cell_ids <- paste0("Cell", seq_len(n_cells))
cell_type_truth <- rep(paste0("Type", 1:n_cell_types), length.out = n_cells)
batch <- rep(paste0("Batch", 1:n_batches), each = n_cells / n_batches)

metadata <- data.frame(
  cell_id = cell_ids,
  cell_type_truth = cell_type_truth,
  batch = batch,
  stringsAsFactors = FALSE
)

# Simulate baseline expression
counts <- matrix(rpois(n_genes * n_cells, lambda = 1),
                 nrow = n_genes,
                 ncol = n_cells)

# Add cell-type specific signal
for (k in 1:n_cell_types) {
  idx_cells <- which(cell_type_truth == paste0("Type", k))
  idx_genes <- ((k - 1) * 30 + 1):((k - 1) * 30 + 30)
  counts[idx_genes, idx_cells] <- counts[idx_genes, idx_cells] +
    rpois(length(idx_genes) * length(idx_cells), lambda = 4)
}

# Add mild batch effect
batch_shift <- ifelse(batch == "Batch2", 1.2, 1)
counts <- sweep(counts, 2, batch_shift, "*")

# Convert to integer
counts <- round(counts)

rownames(counts) <- genes
colnames(counts) <- cell_ids

# Compute QC metrics
nCount_RNA <- colSums(counts)
nFeature_RNA <- colSums(counts > 0)
percent_mt <- colSums(counts[rownames(counts) %in% mt_genes, ]) / nCount_RNA * 100

metadata$nCount_RNA <- nCount_RNA
metadata$nFeature_RNA <- nFeature_RNA
metadata$percent_mt <- percent_mt

# Save outputs
dir.create("data", showWarnings = FALSE)

write.csv(counts, "data/demo-counts.csv")
write.csv(metadata, "data/demo-metadata.csv", row.names = FALSE)

cat("Single-cell demo data generated successfully.\n")
