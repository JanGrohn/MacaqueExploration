plotModel <- function(fit,nt,name){

n = c('b_Intercept','b_nameM','b_nameS','b_conditionpartial','b_nameS:conditionpartial','b_nameM:conditionpartial')
for (ii in 1:length(nt)) {
  n = c(n, paste('b_',nt[ii],sep=''))
  n = c(n, paste('b_nameS:',nt[ii],sep=''))
  n = c(n, paste('b_nameM:',nt[ii],sep=''))
  n = c(n, paste('b_conditionpartial:',nt[ii],sep=''))
  n = c(n, paste('b_nameS:conditionpartial:',nt[ii],sep=''))
  n = c(n, paste('b_nameM:conditionpartial:',nt[ii],sep=''))
}

p = spread_draws(fit,!!sym(n[1]))
for (ii in 2:length(n)) {
  tmp = spread_draws(fit,!!sym(n[ii]))
  p[[n[ii]]] = tmp[[n[ii]]]
}

com = data.frame(t = 1:nrow(p))
com[["Intercept"]] = p$b_Intercept + p$b_nameM/3 + p$b_nameS/3
com[["Intercept_E"]] = p$b_Intercept
com[["Intercept_M"]] = p$b_Intercept + p$b_nameM
com[["Intercept_S"]] = p$b_Intercept + p$b_nameS 
for (ii in 1:length(nt)) {
  com[[nt[ii]]] = p[[paste('b_',nt[ii],sep='')]] + p[[paste('b_nameM:',nt[ii],sep='')]]/3 + p[[paste('b_nameS:',nt[ii],sep='')]]/3
  com[[paste(nt[ii],'_E',sep='')]] = p[[paste('b_',nt[ii],sep='')]] 
  com[[paste(nt[ii],'_M',sep='')]] = p[[paste('b_',nt[ii],sep='')]] + p[[paste('b_nameM:',nt[ii],sep='')]]
  com[[paste(nt[ii],'_S',sep='')]] = p[[paste('b_',nt[ii],sep='')]] + p[[paste('b_nameS:',nt[ii],sep='')]]
}

part = data.frame(t = 1:nrow(p))
part[["Intercept"]] = p$b_Intercept + p$b_conditionpartial + p$b_nameM/3 + p$`b_nameM:conditionpartial`/3 + p$b_nameS/3 + p$`b_nameS:conditionpartial`/3
part[["Intercept_E"]] = p$b_Intercept + p$b_conditionpartial
part[["Intercept_M"]] = p$b_Intercept + p$b_conditionpartial + p$b_nameM + p$`b_nameM:conditionpartial`
part[["Intercept_S"]] = p$b_Intercept + p$b_conditionpartial + p$b_nameS + p$`b_nameS:conditionpartial`

for (ii in 1:length(nt)) {
  part[[nt[ii]]] = p[[paste('b_',nt[ii],sep='')]] + p[[paste('b_conditionpartial:',nt[ii],sep='')]] + p[[paste('b_nameM:',nt[ii],sep='')]]/3 + p[[paste('b_nameM:conditionpartial:',nt[ii],sep='')]]/3 + p[[paste('b_nameS:',nt[ii],sep='')]]/3 + p[[paste('b_nameS:conditionpartial:',nt[ii],sep='')]]/3
  part[[paste(nt[ii],'_E',sep='')]] = p[[paste('b_',nt[ii],sep='')]] + p[[paste('b_conditionpartial:',nt[ii],sep='')]]
  part[[paste(nt[ii],'_M',sep='')]] = p[[paste('b_',nt[ii],sep='')]] + p[[paste('b_conditionpartial:',nt[ii],sep='')]] + p[[paste('b_nameM:',nt[ii],sep='')]] + p[[paste('b_nameM:conditionpartial:',nt[ii],sep='')]]
  part[[paste(nt[ii],'_S',sep='')]] = p[[paste('b_',nt[ii],sep='')]] + p[[paste('b_conditionpartial:',nt[ii],sep='')]] + p[[paste('b_nameS:',nt[ii],sep='')]] + p[[paste('b_nameS:conditionpartial:',nt[ii],sep='')]]
}

com2 <- melt(com, id.vars = "t")
com2$t[com2$variable=="Intercept_E"|com2$variable=="Intercept_M"|com2$variable=="Intercept_S"|com2$variable=="Intercept"] = 2
for (ii in 1:length(nt)) {
  com2$t[com2$variable==nt[ii]|com2$variable==paste(nt[ii],'_E',sep='')|com2$variable==paste(nt[ii],'_M',sep='')|com2$variable==paste(nt[ii],'_S',sep='')] = 2*(ii+1)
}

part2 <- melt(part, id.vars = "t")
part2$t[part2$variable=="Intercept_E"|part2$variable=="Intercept_M"|part2$variable=="Intercept_S"|part2$variable=="Intercept"] = 2
for (ii in 1:length(nt)) {
  part2$t[part2$variable==nt[ii]|part2$variable==paste(nt[ii],'_E',sep='')|part2$variable==paste(nt[ii],'_M',sep='')|part2$variable==paste(nt[ii],'_S',sep='')] = 2*(ii+1)
}
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
cbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

c = rep(c(rep(cbPalette[2],nrow(com)),rep(cbPalette[3],nrow(com)),rep(cbPalette[4],nrow(com)),rep(cbPalette[6],nrow(com))),length(nt)+1)


c = rep(c(rep("a",nrow(com)),rep("b",nrow(com)),rep("c",nrow(com)),rep("d",nrow(com))),length(nt)+1)
al = rep(c(0.8,0.5,0.5,0.5),each=nrow(com),times=length(nt)+1)
al = as.factor(rep(c(1,0.9,0.9,0.9),each=nrow(com),times=length(nt)+1))


diff = data.frame(t = 1:nrow(p))
diff$Intercept= p$b_conditionpartial + p$`b_nameM:conditionpartial`/3 + p$`b_nameS:conditionpartial`/3
diff$Intercept_E = p$b_conditionpartial 
diff$Intercept_M = p$b_conditionpartial +  p$`b_nameM:conditionpartial`
diff$Intercept_S = p$b_conditionpartial + p$`b_nameS:conditionpartial`

for (ii in 1:length(nt)) {
  diff[[nt[ii]]] = p[[paste('b_conditionpartial:',nt[ii],sep='')]] + p[[paste('b_nameM:conditionpartial:',nt[ii],sep='')]]/3 + p[[paste('b_nameS:conditionpartial:',nt[ii],sep='')]]/3
  diff[[paste(nt[ii],'_E',sep='')]] = p[[paste('b_conditionpartial:',nt[ii],sep='')]]
  diff[[paste(nt[ii],'_M',sep='')]] = p[[paste('b_conditionpartial:',nt[ii],sep='')]] + p[[paste('b_nameM:conditionpartial:',nt[ii],sep='')]]
  diff[[paste(nt[ii],'_S',sep='')]] = p[[paste('b_conditionpartial:',nt[ii],sep='')]] + p[[paste('b_nameS:conditionpartial:',nt[ii],sep='')]]
}

diff2 = melt(diff,id.vars="t")
diff2$t[diff2$variable=="Intercept_E"|diff2$variable=="Intercept_M"|diff2$variable=="Intercept_S"|diff2$variable=="Intercept"] = 2
for (ii in 1:length(nt)) {
  diff2$t[diff2$variable==nt[ii]|diff2$variable==paste(nt[ii],'_E',sep='')|diff2$variable==paste(nt[ii],'_M',sep='')|diff2$variable==paste(nt[ii],'_S',sep='')] = 2*(ii+1)
}

both = data.frame(t = 1:nrow(p))
both$Intercept= p$b_Intercept*2 + p$b_conditionpartial + p$b_nameM/1.5 + p$`b_nameM:conditionpartial`/3 + p$b_nameS/1.5 + p$`b_nameS:conditionpartial`/3
both$Intercept_E = p$b_Intercept*2 + p$b_conditionpartial
both$Intercept_M = p$b_Intercept*2 + p$b_conditionpartial + p$b_nameM*2 +  p$`b_nameM:conditionpartial`
both$Intercept_S = p$b_Intercept*2 + p$b_conditionpartial + p$b_nameS*2 + p$`b_nameS:conditionpartial`
for (ii in 1:length(nt)) {
  both[[nt[ii]]] = p[[paste('b_',nt[ii],sep='')]]*2 + p[[paste('b_conditionpartial:',nt[ii],sep='')]] + p[[paste('b_nameM:',nt[ii],sep='')]]/1.5 + p[[paste('b_nameM:conditionpartial:',nt[ii],sep='')]]/3 + p[[paste('b_nameS:',nt[ii],sep='')]]/1.5 + p[[paste('b_nameS:conditionpartial:',nt[ii],sep='')]]/3
  both[[paste(nt[ii],'_E',sep='')]] = p[[paste('b_',nt[ii],sep='')]]*2 + p[[paste('b_conditionpartial:',nt[ii],sep='')]]
  both[[paste(nt[ii],'_M',sep='')]] = p[[paste('b_',nt[ii],sep='')]]*2 + p[[paste('b_conditionpartial:',nt[ii],sep='')]] + p[[paste('b_nameM:',nt[ii],sep='')]]*2 + p[[paste('b_nameM:conditionpartial:',nt[ii],sep='')]]
  both[[paste(nt[ii],'_S',sep='')]] = p[[paste('b_',nt[ii],sep='')]]*2 + p[[paste('b_conditionpartial:',nt[ii],sep='')]] + p[[paste('b_nameS:',nt[ii],sep='')]]*2 + p[[paste('b_nameS:conditionpartial:',nt[ii],sep='')]]
}

both2 = melt(both,id.vars="t")
both2$t[both2$variable=="Intercept_E"|both2$variable=="Intercept_M"|both2$variable=="Intercept_S"|both2$variable=="Intercept"] = 2
for (ii in 1:length(nt)) {
  both2$t[both2$variable==nt[ii]|both2$variable==paste(nt[ii],'_E',sep='')|both2$variable==paste(nt[ii],'_M',sep='')|both2$variable==paste(nt[ii],'_S',sep='')] = 2*(ii+1)
}

nt3 = rev(c("Intercept",nt))

stats = data.frame(t = 0:length(nt)+1)
row.names(stats) = nt3
stats$partial = 0:length(nt)+1
stats$complete = 0:length(nt)+1
stats$`partial + complete` = 0:length(nt)+1
stats$`partial - complete` = 0:length(nt)+1
stats = stats[-1]
for (ii in 1:(length(nt)+1)) {
  stats[[4]][ii]= round(sum(diff[[nt3[ii]]] > 0) / nrow(diff),3)
  stats[[3]][ii] = round(sum(both[[nt3[ii]]] > 0) / nrow(both),3)
  stats[[1]][ii] = round(sum(part[[nt3[ii]]] > 0) / nrow(part),3)
  stats[[2]][ii] = round(sum(com[[nt3[ii]]] > 0) / nrow(com),3)
}

tab <- ggtexttable(stats, theme = ttheme("mOrange"))

write.csv(part,paste(name,"partial.csv",sep = "_"))
write.csv(com,paste(name,"complete.csv",sep = "_"))
write.csv(both,paste(name,"combined.csv",sep = "_"))
write.csv(diff,paste(name,"difference.csv",sep = "_"))

allPlot = ggplot() +  
  stat_slabh(data = part2,aes(alpha=al,y=t, x = value,fill=c),colour="black", side = "bottom") +  
  stat_slabh(data = com2,aes(alpha=al,y=t, x = value,fill=c),colour="black") + 
  coord_flip(xlim = NULL, ylim = c(1,1+2*(length(nt)+1)), expand = TRUE, clip = "on") +
  scale_y_continuous(breaks = seq(4,(length(nt)+1)*2,2),labels = nt) +
  #  scale_y_continuous(breaks = sort(c(seq(3.8,(length(nt)+1)*2-0.2,2),seq(4.2,(length(nt)+1)*2+0.2,2))),labels = nt2) +
  scale_fill_manual(values=cbPalette,labels=c("all","monkey E","monkey M","monkey S"),name=element_blank()) + 
  scale_alpha_manual(values=c(0.4,0.9),guide = FALSE) +
  geom_vline(xintercept=0) +
  xlab("regression weight") + 
  ylab("") +
  theme_classic() 
#  theme(axis.text.x = element_text(angle = 45, hjust = 1))


diffPlot = ggplot() + 
  stat_slabh(data = diff2,aes(alpha=al,y=t, x = value, fill = c ),colour="black") +
  scale_y_continuous(breaks = seq(4,(length(nt)+1)*2,2),labels = nt) +
  scale_fill_manual(values=cbPalette,guide = FALSE) + 
  scale_alpha_manual(values=c(0.4,0.9),guide = FALSE) +
  geom_vline(xintercept=0) +
  ylab("")+
  xlab("regression weight (partial - complete)") +
  theme_classic()

bothPlot = ggplot() + 
  stat_slabh(data = both2,aes(alpha=al,y=t, x = value, fill = c ),colour="black") +
  scale_y_continuous(breaks = seq(4,(length(nt)+1)*2,2),labels = nt) +
  scale_fill_manual(values=cbPalette,guide = FALSE) + 
  scale_alpha_manual(values=c(0.4,0.9),guide = FALSE) +
  geom_vline(xintercept=0) +
  ylab("")+
  xlab("regression weight (partial + complete)") + 
  theme_classic()

ggarrange(allPlot,                                                
          ggarrange(bothPlot, diffPlot, tab, ncol = 3, labels = c("B", "C", "D")), 
          nrow = 2, 
          labels = "A"                                       
) 

}
