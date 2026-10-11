# Normalisation function from the submitted supplier evaluation scripts.
# A must be a positive pairwise comparison matrix.
ahp_weights <- function(A) {
  A <- as.matrix(A)
  A_norm <- sweep(A, 2, colSums(A), "/")
  w <- rowMeans(A_norm)
  w / sum(w)
}

# Source top-level priorities: Cost, Operational, Risk.
# These inputs are NOT the final normalised AHP weights.
regular_priorities <- c(3, 7, 5)
event_priorities   <- c(7, 5, 3)
backup_priorities  <- c(2, 8, 5)
