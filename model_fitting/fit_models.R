setwd("/Users/jangrohn/Documents/GitHub/macaque_strategic_exploration/model_fitting")

library(brms)
library(magrittr)
library(dplyr)
library(purrr)
library(forcats)
library(tidyr)
library(modelr)
library(tidybayes)
library(ggplot2)
library(ggstance)
library(cowplot)
library(rstan)
library(brms)
library(ggrepel)
library(RColorBrewer)
library(gganimate)
library(reshape2)
library(ggpubr)
source("plotModel.R")

dt = read.csv(file = 'data.csv')
dt$condition[dt$condition==1]="complete"
dt$condition[dt$condition==2]="partial"

# Fig S1
dttmp = dt[!is.na(dt$rightChoice_first)&!is.na(dt$horizon)&dt$RT!=99999&(dt$condition=="complete"|dt$condition=="partial"),]
dttmp2 = data.frame(y=1:8120)
dttmp2$horizonXER = scale(dttmp$horizon*dttmp$ER)
dttmp2$horizonXU = scale(dttmp$horizon*dttmp$U)
dttmp2$ER = scale(dttmp$ER)
dttmp2$name = dttmp$name
dttmp2$horizon = scale(dttmp$horizon)
dttmp2$condition = dttmp$condition
dttmp2$RB = scale(dttmp$RB)
dttmp2$U = scale(dttmp$U)
dttmp2$sessID = dttmp$sessID
dttmp2$rightChoice_first = dttmp$rightChoice_first

fit1 <- brm(formula = rightChoice_first ~ name*condition*horizon+name*condition*U+name*condition*ER+name*condition*horizonXER+name*condition*RB+name*condition*horizonXU
            + (1 + ER+RB+horizon+U+horizonXER+horizonXU|gr(name:sessID,by=name)),
            data = dttmp2, family = bernoulli(),
            warmup = 1000, iter = 2000, chains = 12, cores = 12,
            control = list(adapt_delta = 0.95))
nt = c('RB','ER','U','horizon','horizonXER','horizonXU')
plotModel(fit1,nt,"fit1")

# Fig S2
dttmp = dt[!is.na(dt$rightChoice_first)&!is.na(dt$horizon)&dt$RT!=99999&(dt$condition=="complete"|dt$condition=="partial")&dt$availableInfo==0,]
dttmp2 = data.frame(y=1:4051)
dttmp2$horizonXER = scale(dttmp$horizon*dttmp$ER)
dttmp2$horizonXU = scale(dttmp$horizon*dttmp$U)
dttmp2$ER = scale(dttmp$ER)
dttmp2$name = dttmp$name
dttmp2$horizon = scale(dttmp$horizon)
dttmp2$condition = dttmp$condition
dttmp2$RB = scale(dttmp$RB)
dttmp2$U = scale(dttmp$U)
dttmp2$sessID = dttmp$sessID
dttmp2$rightChoice_first = dttmp$rightChoice_first

fit1matched <- brm(formula = rightChoice_first ~ name*condition*horizon+name*condition*U+name*condition*ER+name*condition*horizonXER+name*condition*RB+name*condition*horizonXU
                   + (1 + ER+RB+horizon+U+horizonXER+horizonXU|gr(name:sessID,by=name)),
                   data = dttmp2, family = bernoulli(),
                   warmup = 1000, iter = 2000, chains = 12, cores = 12,
                   control = list(adapt_delta = 0.95))
nt = c('RB','ER','U','horizon','horizonXER','horizonXU')
plotModel(fit1matched,nt,"fit1matched")

# Fig S5
dttmp = dt[!is.na(dt$rightChoice_234)&!is.na(dt$horizon)&dt$RT!=99999&(dt$condition=="complete"|dt$condition=="partial"),]
dttmp2 = data.frame(y=1:12128)
dttmp2$RB = scale(dttmp$RB)
dttmp2$deltaERchosen = scale(dttmp$deltaERchosen)
dttmp$deltaERcounterfactual[dttmp$condition=="partial"] = NA
dttmp2$deltaERcounterfactual = scale(dttmp$deltaERcounterfactual)
dttmp2$deltaERcounterfactual[is.na(dttmp2$deltaERcounterfactual)] = 0
dttmp2$baselineER = scale(dttmp$baselineER)
dttmp2$deltaUchosen = scale(dttmp$deltaUchosen)
dttmp$deltaUcounterfactual[dttmp$condition=="partial"] = NA
dttmp2$deltaUcounterfactual = scale(dttmp$deltaUcounterfactual)
dttmp2$deltaUcounterfactual[is.na(dttmp2$deltaUcounterfactual)] = 0
dttmp2$baselineU = scale(dttmp$baselineU)
dttmp2$deltaChosen = scale(dttmp$deltaChosen)
dttmp2$sessID = dttmp$sessID
dttmp2$name = dttmp$name
dttmp2$condition = dttmp$condition
dttmp2$rightChoice_2345 = dttmp$rightChoice_234

fit2 <- brm(formula = rightChoice_234 ~ name*condition*RB+name*condition*deltaERchosen+name*condition*deltaERcounterfactual+name*condition*baselineER+name*condition*deltaUchosen+name*condition*deltaUcounterfactual+name*condition*baselineU+name*condition*deltaChosen
            + (1 + RB+deltaERchosen+deltaERcounterfactual+baselineER+deltaUchosen+deltaUcounterfactual+baselineU+deltaChosen|gr(name:sessID,by=name)),
            data = dttmp2, family = bernoulli(),
            warmup = 1000, iter = 2000, chains = 12, cores = 12,
            control = list(adapt_delta = 0.95))
nt = c('RB','deltaERchosen','deltaERcounterfactual','baselineER','deltaUchosen','deltaUcounterfactual','baselineU','deltaChosen')
plotModelCounterfactual(fit2,nt,"fit2")

# Fig S3
dttmp = dt[!is.na(dt$rightChoice_first)&!is.na(dt$horizon)&dt$RT!=99999&(dt$condition=="complete"|dt$condition=="partial"),]
dttmp2 = data.frame(y=1:8120)
dttmp2$horizonXER = scale(dttmp$horizon*dttmp$ER)
dttmp2$horizonXavailableInfo = scale(dttmp$horizon*dttmp$availableInfo)
dttmp2$ER = scale(dttmp$ER)
dttmp2$name = dttmp$name
dttmp2$horizon = scale(dttmp$horizon)
dttmp2$condition = dttmp$condition
dttmp2$RB = scale(dttmp$RB)
dttmp2$availableInfo = scale(dttmp$availableInfo)
dttmp2$sessID = dttmp$sessID
dttmp2$rightChoice_first = dttmp$rightChoice_first

fit3 <- brm(formula = rightChoice_first ~ name*condition*horizon+name*condition*availableInfo+name*condition*ER+name*condition*horizonXER+name*condition*RB+name*condition*horizonXavailableInfo
            + (1 + ER+RB+horizon+availableInfo+horizonXER+horizonXavailableInfo|gr(name:sessID,by=name)),
            data = dttmp2, family = bernoulli(),
            warmup = 1000, iter = 2000, chains = 12, cores = 12,
            control = list(adapt_delta = 0.95))
nt = c('RB','ER','availableInfo','horizon','horizonXER','horizonXavailableInfo')
plotModel(fit3,nt,"fit3")

