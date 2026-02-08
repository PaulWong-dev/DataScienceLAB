
results_df <- data.frame(
  Name = c("Robert", "Hemsworth", "Scarlett", "Evans", "Pratt",
           "Larson", "Holland", "Paul", "Simu", "Renner"),
  Chemistry = c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59),
  Physics =   c(89, 86, 65, 52, 60, 67, 40, 77, 90, 61)
)


chem_fail_count <- sum(results_df$Chemistry <= 49)
phy_fail_count  <- sum(results_df$Physics <= 49)

max_chem <- max(results_df$Chemistry)
best_chem_student <- results_df$Name[results_df$Chemistry == max_chem]

max_phy <- max(results_df$Physics)
best_phy_student <- results_df$Name[results_df$Physics == max_phy]

cat("Number of students who failed Chemistry:", chem_fail_count, "\n")
cat("Number of students who failed Physics:  ", phy_fail_count, "\n\n")

cat("Highest Chemistry Score:", max_chem, "by", paste(best_chem_student, collapse = ", "), "\n")
cat("Highest Physics Score:  ", max_phy, "by", paste(best_phy_student, collapse = ", "), "\n")