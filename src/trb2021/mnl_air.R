apollo_control <- list(
  modelName = "mnl_air",
  modelDescr = "MNL with Factor Analysis",
  indivID = "ID"
)

choiceAnalysis_settings <- list(
  alternatives = c(zero = 1, smlr = 2, same = 3, grtr = 4),
  avail = 1,
  choiceVar = database$biz_air,
  explanators = database[, c(
    "City", "Age", "Inc", "Hel", "Edc", "Gen", "Ngh", "Rac"
  )]
)

apollo_choiceAnalysis(choiceAnalysis_settings, apollo_control, database)

apollo_beta <- c(
  asc_smlr = 0,
  asc_same = 0,
  asc_grtr = 0,
  b_City_Midwest_smlr = 0,
  b_City_South_smlr = 0,
  b_City_Northeast_smlr = 0,
  b_Age_Millenials_smlr = 0,
  b_Age_GenX_smlr = 0,
  b_Age_Older_smlr = 0,
  b_Inc_Mid_smlr = 0,
  b_Inc_High_smlr = 0,
  b_Hel_Disagree_smlr = 0,
  b_Hel_Agree_smlr = 0,
  b_Edc_MoreBachelor_smlr = 0,
  b_Gen_NonFemale_smlr = 0,
  b_Ngh_NonUrban_smlr = 0,
  b_Rac_Other_smlr = 0,
  b_City_Midwest_same = 0,
  b_City_South_same = 0,
  b_City_Northeast_same = 0,
  b_Age_Millenials_same = 0,
  b_Age_GenX_same = 0,
  b_Age_Older_same = 0,
  b_Inc_Mid_same = 0,
  b_Inc_High_same = 0,
  b_Hel_Disagree_same = 0,
  b_Hel_Agree_same = 0,
  b_Edc_MoreBachelor_same = 0,
  b_Gen_NonFemale_same = 0,
  b_Ngh_NonUrban_same = 0,
  b_Rac_Other_same = 0,
  b_City_Midwest_grtr = 0,
  b_City_South_grtr = 0,
  b_City_Northeast_grtr = 0,
  b_Age_Millenials_grtr = 0,
  b_Age_GenX_grtr = 0,
  b_Age_Older_grtr = 0,
  b_Inc_Mid_grtr = 0,
  b_Inc_High_grtr = 0,
  b_Hel_Disagree_grtr = 0,
  b_Hel_Agree_grtr = 0,
  b_Edc_MoreBachelor_grtr = 0,
  b_Gen_NonFemale_grtr = 0,
  b_Ngh_NonUrban_grtr = 0,
  b_Rac_Other_grtr = 0
)

apollo_fixed = c()

apollo_choiceAnalysis(choiceAnalysis_settings, apollo_control, database)

apollo_inputs <- apollo_validateInputs()

apollo_probabilities <- function(apollo_beta, apollo_inputs, functionality = "estimate") {
  apollo_attach(apollo_beta, apollo_inputs)
  on.exit(apollo_detach(apollo_beta, apollo_inputs))
  
  P <- list()
  
  V <- list()
  V[["zero"]] <- 0
  V[["smlr"]] <- asc_smlr +
    b_City_Midwest_smlr * (City == 2) +
    b_City_South_smlr * (City == 3) +
    b_City_Northeast_smlr * (City == 4)  +
    b_Age_Millenials_smlr * (Age == 2) +
    b_Age_GenX_smlr * (Age == 3) +
    b_Age_Older_smlr * (Age == 4)  +
    b_Inc_Mid_smlr * (Inc == 2)  +
    b_Inc_High_smlr * (Inc == 3) +
    b_Hel_Disagree_smlr * (Hel == 1) +
    b_Hel_Agree_smlr * (Hel == 3) +
    b_Edc_MoreBachelor_smlr * (Edc == 2) +
    b_Gen_NonFemale_smlr * (Gen == 2)  +
    b_Ngh_NonUrban_smlr * (Ngh == 2) +
    b_Rac_Other_smlr * (Rac == 2)
  V[["same"]] <- asc_same +
    b_City_Midwest_same * (City == 2) +
    b_City_South_same * (City == 3) +
    b_City_Northeast_same * (City == 4)  +
    b_Age_Millenials_same * (Age == 2) +
    b_Age_GenX_same * (Age == 3) +
    b_Age_Older_same * (Age == 4)  +
    b_Inc_Mid_same * (Inc == 2)  +
    b_Inc_High_same * (Inc == 3) +
    b_Hel_Disagree_same * (Hel == 1) +
    b_Hel_Agree_same * (Hel == 3) +
    b_Edc_MoreBachelor_same * (Edc == 2) +
    b_Gen_NonFemale_same * (Gen == 2)  +
    b_Ngh_NonUrban_same * (Ngh == 2) +
    b_Rac_Other_same * (Rac == 2)
  V[["grtr"]] <- asc_grtr +
    b_City_Midwest_grtr * (City == 2) +
    b_City_South_grtr * (City == 3) +
    b_City_Northeast_grtr *(City == 4)  +
    b_Age_Millenials_grtr * (Age == 2) +
    b_Age_GenX_grtr * (Age == 3) +
    b_Age_Older_grtr * (Age == 4)  +
    b_Inc_Mid_grtr * (Inc == 2)  +
    b_Inc_High_grtr * (Inc == 3) +
    b_Hel_Disagree_grtr * (Hel == 1) +
    b_Hel_Agree_grtr * (Hel == 3) +
    b_Edc_MoreBachelor_grtr * (Edc == 2) +
    b_Gen_NonFemale_grtr * (Gen == 2)  +
    b_Ngh_NonUrban_grtr * (Ngh == 2) +
    b_Rac_Other_grtr * (Rac == 2)
  
  mnl_settings <- list(
    alternatives = c(zero = 1, smlr = 2, same = 3, grtr = 4),
    avail = 1,
    choiceVar = biz_air,
    V = V
  )
  
  P[["model"]] <- apollo_mnl(mnl_settings, functionality)
  
  P <- apollo_prepareProb(P, apollo_inputs, functionality)
  return(P)
}

model <- apollo_estimate(apollo_beta, apollo_fixed, apollo_probabilities, apollo_inputs)

apollo_modelOutput(model)
apollo_saveOutput(model)
sink(paste(model$apollo_control$modelName, "_additional_output.txt", sep = ""), split = TRUE)
if (sink.number() > 0) sink()