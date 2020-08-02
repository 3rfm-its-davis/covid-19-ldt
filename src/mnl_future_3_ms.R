setwd(paste(here::here(), "/src/dist", sep = ""))

apollo_control <- list(modelName = "mnl_future_3_ms",
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
  "asc"
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
        get(varList[1])
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