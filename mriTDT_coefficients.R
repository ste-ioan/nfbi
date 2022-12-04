library(gamlj)

data  <- readRDS("~/jamovi analyses/mriTDT/complete_dataset_MRItdt.rds")

# for some reason block is read as numerical, convert it to category
data$block<-as.factor(data$block)

modello <- gamlj::gamljGlmMixed(formula = ACCtar ~ 1 + Quadrante + sessione  + Quadrante:sessione+( 1 + Quadrante + sessione + Quadrante:sessione| subnumber ),
                                data = data,
                                contrasts = list(
                                    list(
                                        var="Quadrante",
                                        type="simple"),
                                    list(
                                        var="sessione",
                                        type="simple")),
                                plotHAxis = sessione,
                                plotSepLines = Quadrante,
                                plotError = "ci")

# same result as jamovi, now get subjects coefficients
library(lme4)
ranef(modello$model)
