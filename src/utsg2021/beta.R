beta <- function(vars, factors = NULL) {
  if (!is.null(factors)) {
    varNames <- alts %>%
      map(~ {
        paste0("b_", vars, "_", .x)
      }) %>%
      unlist()

    factorNames <- c("d_", "sigma_") %>%
      map(~ {
        paste0(.x, factors)
      }) %>%
      unlist()

    beta <- c(
      rep(0, length(varNames)),
      rep(1, length(factorNames)),
      lambda1_same = 0,
      lambda1_more = 0,
      lambda2_same = 0,
      lambda2_more = 0,
      lambda3_same = 0,
      lambda3_more = 0,
      lambda4_same = 0,
      lambda4_more = 0,
      lambda5_same = 0,
      lambda5_more = 0
    )

    names(beta)[seq_len(length(varNames))] <- varNames
    names(beta)[
      (length(varNames) + 1):
      (length(varNames) + length(factorNames))
    ] <- factorNames

    return(beta)
  } else {
    beta <- c(rep(0, length(vars)))
    names(beta) <- vars

    return(beta)
  }
}