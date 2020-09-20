knitr::opts_chunk$set(echo = TRUE)

library(ggplot2)
library(psych)
library(MASS)
library(apollo)
library(tidyverse)
library(fastDummies)
library(psych)
library(GPArotation)

path <- file.path(here::here(), "src/utsg2021")
setwd(path)

source("./getRaw.R")
raw <- getRaw()

source("./outputStats.R")
outputStats()

source("./createY.R")
y <- createY(raw)

source("./getSocio.R")
s <- getSocio(raw, y)

source("./getFactor.R")
f <- getFactor(raw, y)

source("./outputStatsByCategory.R")
outputStatsByCategory(s, y)

database <- inner_join(y, s, f, by = "ResponseId") %>%
  mutate(Rac = case_when(
    Raw == 1 ~ 1,
    T ~ 2
  )) %>%
  as.data.frame() %>%
  select(-ResponseId) %>%
  mutate(ID = seq_len(dim(y)[1]))

source("./ordered.R")
ordered(database)

source("./iclv.R")
iclv(database)