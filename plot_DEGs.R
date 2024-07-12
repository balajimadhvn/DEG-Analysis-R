# Load the necessary libraries for plotting
library(ggplot2)  # For creating sophisticated plots
library(ggrepel)  # Helps in avoiding label overlap in plots
library(pheatmap) # Useful for heatmap visualization

# Assume we have data from RNA-seq experiments in 'deg_data' dataframe
# It includes columns like 'Gene', 'Log2FC', 'PValue', 'FDR', 'Expression1', 'Expression2'
# This is a simplified example dataset:

# Example data: Replace with your own DEG data
set.seed(123)
deg_data <- data.frame(
  Gene = paste0("Gene", 1:100),
  Log2FC = rnorm(100, mean = 2, sd = 0.5),
  PValue = runif(100, min = 0, max = 0.05),
  FDR = runif(100, min = 0, max = 0.1),
  Expression1 = rnorm(100, mean = 10, sd = 2),
  Expression2 = rnorm(100, mean = 12, sd = 2)
)



# Volcano plot to show fold change vs. statistical significance
volcano_plot <- ggplot(deg_data, aes(x = Log2FC, y = -log10(PValue))) +
  geom_point(aes(color = ifelse(FDR < 0.05, "red", "black")), alpha = 0.6) +
  scale_color_manual(values = c("black" = "black", "red" = "red")) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "red") +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", color = "blue") +
  labs(title = "Volcano Plot", x = "Log2 Fold Change", y = "-log10(P-Value)") +
  theme_minimal()

# MA plot to visualize relationship between two sets of expression data
ma_plot <- ggplot(deg_data, aes(x = Expression1, y = Expression2)) +
  geom_point(alpha = 0.6) +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "blue") +
  labs(title = "MA Plot", x = "Expression 1", y = "Expression 2") +
  theme_minimal()

# Heatmap plot to show gene expression across samples
heatmap_data <- as.matrix(deg_data[, c("Expression1", "Expression2")])
heatmap_plot <- heatmap(heatmap_data, 
                        show_rownames = FALSE, 
                        cluster_rows = TRUE, 
                        cluster_cols = TRUE,
                        main = "Heatmap of Gene Expression")

# Gene expression plot to visualize expression distribution for each gene
gene_expression_plot <- ggplot(deg_data, aes(x = Gene, y = Expression1)) +
  geom_boxplot() +
  labs(title = "Gene Expression Distribution", x = "Gene", y = "Expression Level") +
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())

# Now let's display these plots
print(volcano_plot)
print(ma_plot)
print(gene_expression_plot)

