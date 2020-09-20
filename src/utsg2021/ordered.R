ordered <- function(database, env = globalenv()) {
  database <- database %>%
    filter(biz_all != 1) %>%
    mutate(biz_all = biz_all - 1)

  path <- get("path", envir = globalenv())
  setwd(file.path(path, "output"))
  apollo_control <- list(
    modelName = "ordered_true",
    modelDescr = "Ordered Logit",
    indivID = "ID"
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

  alts <- c("fewer", "same", "more")
  vars <- c(
    "b_City_Midwest",
    "b_City_South",
    "b_City_Northeast",
    "b_Age_GenZ",
    "b_Age_Millenials",
    "b_Age_Older",
    "b_Inc_Mid",
    "b_Inc_High",
    "b_Hel",
    "b_Vdc",
    "b_Edc_MoreBachelor",
    "b_Gen_NonMale",
    "b_Chl_Yes",
    "b_Ngh_NonUrban",
    "asc"
  )

  assign("alts", alts, envir = globalenv())
  assign("vars", vars, envir = globalenv())

  source("../beta.R")
  apollo_beta <- beta(vars)
  apollo_beta["tau_fewer"] <- 1.5
  apollo_beta["tau_same"] <- 2.5
  assign("apollo_beta", apollo_beta, envir = globalenv())

  apollo_fixed <- c()
  assign("apollo_fixed", apollo_fixed, envir = globalenv())

  apollo_choiceAnalysis(choiceAnalysis_settings, apollo_control, database)

  apollo_inputs <- apollo_validateInputs()

  apollo_probabilities <-
    function(apollo_beta, apollo_inputs, functionality = "estimate") {
      apollo_attach(apollo_beta, apollo_inputs)
      on.exit(apollo_detach(apollo_beta, apollo_inputs))

      P <- list()

      V <-
        get(vars[1]) * (City == 2) +
        get(vars[2]) * (City == 3) +
        get(vars[3]) * (City == 4) +
        get(vars[4]) * (Age == 2) +
        get(vars[5]) * (Age == 3) +
        get(vars[6]) * (Age == 4) +
        get(vars[7]) * (Inc == 2) +
        get(vars[8]) * (Inc == 3) +
        get(vars[9]) * Hel +
        get(vars[10]) * Vdc +
        get(vars[11]) * (Edc == 2) +
        get(vars[12]) * (Gen == 2) +
        get(vars[13]) * (Chl == 2) +
        get(vars[14]) * (Ngh == 2) +
        get(vars[15])

      ol_settings <- list(
        outcomeOrdered = biz_all,
        V = V,
        tau = c(tau_fewer, tau_same)
      )

      P[["model"]] <- apollo_ol(ol_settings, functionality)
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