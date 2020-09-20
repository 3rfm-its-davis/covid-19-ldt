setwd(paste(here::here(), "/src/dist", sep = ""))

apollo_control <- list(modelName = "mnl_future_3",
                       modelDescr = "MNL with Factor Analysis",
                       indivID = "ID")

choiceAnalysis_settings <- list(
  alternatives = c(
    smlr = 1,
    same = 2,
    grtr = 3
  ),
  avail = 1,
  choiceVar = database$future,
  explanators = database[, c("City", "Age", "Inc", "Hel", "Edc", "Vdc", "Rem", "Chl", "Gen", "Ngh", "Rac")]
)

apollo_choiceAnalysis(choiceAnalysis_settings, apollo_control, database)

alts = c("smlr", "grtr")
vars = c(
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
  "Rem",
  "Vdc",
  "Edc_MoreBachelor",
  "Gen_NonMale",
  "Chl_Yes",
  "Ngh_NonUrban",
  "Rac_Other"
)

nameVec = alts %>% map( ~ {
  paste("b_", vars, "_", .x, sep = "")
}) %>% unlist

apollo_beta <- rep(0, length(nameVec))
names(apollo_beta) = nameVec

apollo_fixed = c()

apollo_choiceAnalysis(choiceAnalysis_settings, apollo_control, database)

apollo_inputs <- apollo_validateInputs()

apollo_probabilities <-
  function(apollo_beta,
           apollo_inputs,
           functionality = "estimate") {
    apollo_attach(apollo_beta, apollo_inputs)
    on.exit(apollo_detach(apollo_beta, apollo_inputs))
    
    P <- list()
    
    V <- list()
    V[["same"]] <- 0
    
    for (i in alts) {
      varList = paste("b_", vars, "_", i, sep = "")
      V[[i]] = 
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
        get(varList[11]) * (Rem == 2) +
        get(varList[12]) * Vdc +
        get(varList[13]) * (Edc == 2) +
        get(varList[14]) * (Gen == 2) +
        get(varList[15]) * (Chl == 2) +
        get(varList[16]) * (Ngh == 2) +
        get(varList[17]) * (Rac == 2)
    }
    
    mnl_settings <- list(
      alternatives = c(
        smlr = 1,
        same = 2,
        grtr = 3
      ),
      avail = 1,
      choiceVar = future,
      V = V
    )
    
    P[["model"]] <- apollo_mnl(mnl_settings, functionality)
    
    P <- apollo_prepareProb(P, apollo_inputs, functionality)
    return(P)
  }

model <-
  apollo_estimate(apollo_beta,
                  apollo_fixed,
                  apollo_probabilities,
                  apollo_inputs)

apollo_modelOutput(model)
apollo_saveOutput(model)
sink(paste(
  model$apollo_control$modelName,
  "_additional_output.txt",
  sep = ""
),
split = TRUE)
if (sink.number() > 0)
  sink()