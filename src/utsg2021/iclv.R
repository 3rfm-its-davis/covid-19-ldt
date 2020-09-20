iclv <- function(database, env = globalenv()) {
  path <- get("path", envir = globalenv())
  setwd(file.path(path, "output"))
  apollo_control <- list(
    modelName = "ordered",
    modelDescr = "Ordered Logit",
    indivID = "ID",
    mixing = TRUE
  )
  assign("apollo_control", apollo_control, envir = globalenv())

  choiceAnalysis_settings <- list(
    alternatives = c(
      fewer = 1,
      same = 2,
      more = 3
    ),
    avail = 1,
    choiceVar = database$biz_all,
    explanators = database[, c(
      "City", "Age", "Inc", "Hel",
      "Edc", "Vdc", "Chl", "Gen",
      "Ngh", "Rac"
    )]
  )
  assign("choiceAnalysis_settings",
    choiceAnalysis_settings,
    envir = globalenv()
  )

  apollo_choiceAnalysis(choiceAnalysis_settings, apollo_control, database)

  alts <- c("same", "more")
  vars <- c(
    "asc",
    "City_Midwest",
    "City_South",
    "City_Northeast",
    "Age_GenZ",
    "Age_Millenials",
    "Age_Older",
    "Inc_Mid",
    "Inc_High",
    "Hel",
    "Vdc",
    "Edc_MoreBachelor",
    "Gen_NonMale",
    "Chl_Yes",
    "Ngh_NonUrban"
  )
  factors <- c(
    "A01_1_FL4",
    "A01_2_FL5",
    "A01_3_FL3",
    "A01_4_FL2",
    "A01_6_FL3",
    "A02_1_FL1",
    "A02_3_FL2",
    "A03_1_FL5",
    "A03_2_FL5",
    "A03_3_FL3",
    "A03_4_FL2",
    "A03_5_FL5",
    "A04_1_FL2",
    "A04_2_FL5",
    "A04_4_FL4",
    "A04_5_FL4",
    "A05_1_FL5",
    "A05_3_FL4",
    "A05_4_FL1",
    "A05_5_FL4"
  )
  assign("alts", alts, envir = globalenv())
  assign("vars", vars, envir = globalenv())
  assign("factors", factors, envir = globalenv())


  apollo_draws <- list(
    interDrawsType = "halton",
    interNDraws = 100,
    interUnifDraws = c(),
    interNormDraws = c("nu_n1", "nu_n2", "nu_n3", "nu_n4", "nu_n5"),

    intraDrawsType = "",
    intraNDraws = 0,
    intraUnifDraws = c(),
    intraNormDraws = c()
  )
  assign("apollo_draws", apollo_draws, envir = globalenv())

  source("../beta.R")
  apollo_beta <- beta(vars, factors)
  assign("apollo_beta", apollo_beta, envir = globalenv())

  apollo_fixed <- c()
  assign("apollo_fixed", apollo_fixed, envir = globalenv())

  apollo_choiceAnalysis(choiceAnalysis_settings, apollo_control, database)

  apollo_randCoeff <- function(apollo_beta, apollo_inputs) {
    randcoeff <- list()

    randcoeff[["LV1"]] <- nu_n1
    randcoeff[["LV2"]] <- nu_n2
    randcoeff[["LV3"]] <- nu_n3
    randcoeff[["LV4"]] <- nu_n4
    randcoeff[["LV5"]] <- nu_n5

    return(randcoeff)
  }
  assign("apollo_randCoeff", apollo_randCoeff, envir = globalenv())

  apollo_inputs <- apollo_validateInputs()

  apollo_probabilities <-
    function(apollo_beta, apollo_inputs, functionality = "estimate") {
      apollo_attach(apollo_beta, apollo_inputs)
      on.exit(apollo_detach(apollo_beta, apollo_inputs))

      P <- list()

      normalDensity_settings01 <- list(outcomeNormal = A01_1, xNormal = d_A01_1_FL4 * LV4, mu = 0, sigma = sigma_A01_1_FL4)
      normalDensity_settings02 <- list(outcomeNormal = A01_2, xNormal = d_A01_2_FL5 * LV5, mu = 0, sigma = sigma_A01_2_FL5)
      normalDensity_settings03 <- list(outcomeNormal = A01_3, xNormal = d_A01_3_FL3 * LV3, mu = 0, sigma = sigma_A01_3_FL3)
      normalDensity_settings04 <- list(outcomeNormal = A01_4, xNormal = d_A01_4_FL2 * LV2, mu = 0, sigma = sigma_A01_4_FL2)
      normalDensity_settings05 <- list(outcomeNormal = A01_6, xNormal = d_A01_6_FL3 * LV3, mu = 0, sigma = sigma_A01_6_FL3)
      normalDensity_settings06 <- list(outcomeNormal = A02_1, xNormal = d_A02_1_FL1 * LV1, mu = 0, sigma = sigma_A02_1_FL1)
      normalDensity_settings07 <- list(outcomeNormal = A02_3, xNormal = d_A02_3_FL2 * LV2, mu = 0, sigma = sigma_A02_3_FL2)
      normalDensity_settings08 <- list(outcomeNormal = A03_1, xNormal = d_A03_1_FL5 * LV5, mu = 0, sigma = sigma_A03_1_FL5)
      normalDensity_settings09 <- list(outcomeNormal = A03_2, xNormal = d_A03_2_FL5 * LV5, mu = 0, sigma = sigma_A03_2_FL5)
      normalDensity_settings10 <- list(outcomeNormal = A03_3, xNormal = d_A03_3_FL3 * LV3, mu = 0, sigma = sigma_A03_3_FL3)
      normalDensity_settings11 <- list(outcomeNormal = A03_4, xNormal = d_A03_4_FL2 * LV2, mu = 0, sigma = sigma_A03_4_FL2)
      normalDensity_settings12 <- list(outcomeNormal = A03_5, xNormal = d_A03_5_FL5 * LV5, mu = 0, sigma = sigma_A03_5_FL5)
      normalDensity_settings13 <- list(outcomeNormal = A04_1, xNormal = d_A04_1_FL2 * LV2, mu = 0, sigma = sigma_A04_1_FL2)
      normalDensity_settings14 <- list(outcomeNormal = A04_2, xNormal = d_A04_2_FL5 * LV5, mu = 0, sigma = sigma_A04_2_FL5)
      normalDensity_settings15 <- list(outcomeNormal = A04_4, xNormal = d_A04_4_FL4 * LV4, mu = 0, sigma = sigma_A04_4_FL4)
      normalDensity_settings16 <- list(outcomeNormal = A04_5, xNormal = d_A04_5_FL4 * LV4, mu = 0, sigma = sigma_A04_5_FL4)
      normalDensity_settings17 <- list(outcomeNormal = A05_1, xNormal = d_A05_1_FL5 * LV5, mu = 0, sigma = sigma_A05_1_FL5)
      normalDensity_settings18 <- list(outcomeNormal = A05_3, xNormal = d_A05_3_FL4 * LV4, mu = 0, sigma = sigma_A05_3_FL4)
      normalDensity_settings19 <- list(outcomeNormal = A05_4, xNormal = d_A05_4_FL1 * LV1, mu = 0, sigma = sigma_A05_4_FL1)
      normalDensity_settings20 <- list(outcomeNormal = A05_5, xNormal = d_A05_5_FL4 * LV4, mu = 0, sigma = sigma_A05_5_FL4)


      P[["A01_1"]] <- apollo_normalDensity(normalDensity_settings01, functionality)
      P[["A01_2"]] <- apollo_normalDensity(normalDensity_settings02, functionality)
      P[["A01_3"]] <- apollo_normalDensity(normalDensity_settings03, functionality)
      P[["A01_4"]] <- apollo_normalDensity(normalDensity_settings04, functionality)
      P[["A01_6"]] <- apollo_normalDensity(normalDensity_settings05, functionality)
      P[["A02_1"]] <- apollo_normalDensity(normalDensity_settings06, functionality)
      P[["A02_3"]] <- apollo_normalDensity(normalDensity_settings07, functionality)
      P[["A03_1"]] <- apollo_normalDensity(normalDensity_settings08, functionality)
      P[["A03_2"]] <- apollo_normalDensity(normalDensity_settings09, functionality)
      P[["A03_3"]] <- apollo_normalDensity(normalDensity_settings10, functionality)
      P[["A03_4"]] <- apollo_normalDensity(normalDensity_settings11, functionality)
      P[["A03_5"]] <- apollo_normalDensity(normalDensity_settings12, functionality)
      P[["A04_1"]] <- apollo_normalDensity(normalDensity_settings13, functionality)
      P[["A04_2"]] <- apollo_normalDensity(normalDensity_settings14, functionality)
      P[["A04_4"]] <- apollo_normalDensity(normalDensity_settings15, functionality)
      P[["A04_5"]] <- apollo_normalDensity(normalDensity_settings16, functionality)
      P[["A05_1"]] <- apollo_normalDensity(normalDensity_settings17, functionality)
      P[["A05_3"]] <- apollo_normalDensity(normalDensity_settings18, functionality)
      P[["A05_4"]] <- apollo_normalDensity(normalDensity_settings19, functionality)
      P[["A05_5"]] <- apollo_normalDensity(normalDensity_settings20, functionality)

      V <- list()
      V[["fewer"]] <- 0

      for (i in alts) {
        varList <- paste("b_", vars, "_", i, sep = "")
        V[[i]] <-
          get(varList[1]) +
          get(varList[2]) * (City == 2) +
          get(varList[3]) * (City == 3) +
          get(varList[4]) * (City == 4) +
          get(varList[5]) * (Age == 2) +
          get(varList[6]) * (Age == 3) +
          get(varList[7]) * (Age == 4) +
          get(varList[8]) * (Inc == 2) +
          get(varList[9]) * (Inc == 3) +
          get(varList[10]) * Hel +
          get(varList[11]) * Vdc +
          get(varList[12]) * (Edc == 2) +
          get(varList[13]) * (Gen == 2) +
          get(varList[14]) * (Chl == 2) +
          get(varList[15]) * (Ngh == 2) +
          get(paste0("lambda1_", i)) * LV1 +
          get(paste0("lambda2_", i)) * LV2 +
          get(paste0("lambda3_", i)) * LV3 +
          get(paste0("lambda4_", i)) * LV4 +
          get(paste0("lambda5_", i)) * LV5
      }


      mnl_settings <- list(
        alternatives = c(
          fewer = 1,
          same = 2,
          more = 3
        ),
        avail = 1,
        choiceVar = biz_all,
        V = V
      )


      P[["choice"]] <- apollo_mnl(mnl_settings, functionality)

      P <- apollo_combineModels(P, apollo_inputs, functionality)

      P <- apollo_avgInterDraws(P, apollo_inputs, functionality)

      P <- apollo_prepareProb(P, apollo_inputs, functionality)
      return(P)
    }

  model <-
    apollo_estimate(
      apollo_beta,
      apollo_fixed,
      apollo_probabilities,
      apollo_inputs
    )

  apollo_modelOutput(model)
  apollo_saveOutput(model)
  sink(paste(
    model$apollo_control$modelName,
    "_additional_output.txt",
    sep = ""
  ),
  split = TRUE
  )
  if (sink.number() > 0) {
    sink()
  }
  setwd(path)
}