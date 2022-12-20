%Colors
color_partial_SH=[88 172 204]./255;
color_partial_LH=[20 116 153]./255;
color_complete_SH=[225 169 158]./255;
color_complete_LH=[204 88 111]./255;

color_partial=(color_partial_SH+color_partial_LH)./2;
color_complete=(color_complete_SH+color_complete_LH)./2;

color_combined=(color_partial+color_complete)./2;
color_difference=(color_partial+color_complete)./2;

%Behavior
load('data')


%% Fit with uncertainty

%Fit first choice
Complete_with_uncertainty=load('fit1complete.mat');
Partial_with_uncertainty=load('fit1partial.mat');
Difference_with_uncertainty=load('fit1difference.mat');


%% Figure S3

figure
subplot(2,2,1)
bar(1,mean(Partial_with_uncertainty.fit1partial.ER+Partial_with_uncertainty.fit1partial.horizonXER),'Facecolor',color_partial_SH)
hold on
errorbar(1,mean(Partial_with_uncertainty.fit1partial.ER+Partial_with_uncertainty.fit1partial.horizonXER),std(Partial_with_uncertainty.fit1partial.ER+Partial_with_uncertainty.fit1partial.horizonXER),'k','LineWidth',2)
hold on
bar(2,mean(Partial_with_uncertainty.fit1partial.ER-Partial_with_uncertainty.fit1partial.horizonXER),'Facecolor',color_partial_LH)
hold on
errorbar(2,mean(Partial_with_uncertainty.fit1partial.ER-Partial_with_uncertainty.fit1partial.horizonXER),std(Partial_with_uncertainty.fit1partial.ER+Partial_with_uncertainty.fit1partial.horizonXER),'k','LineWidth',2)
hold on
bar(4,mean(Complete_with_uncertainty.fit1complete.ER+Complete_with_uncertainty.fit1complete.horizonXER),'Facecolor',color_complete_SH)
hold on
errorbar(4,mean(Complete_with_uncertainty.fit1complete.ER+Complete_with_uncertainty.fit1complete.horizonXER),std(Complete_with_uncertainty.fit1complete.ER+Complete_with_uncertainty.fit1complete.horizonXER),'k','LineWidth',2)
hold on
bar(5,mean(Complete_with_uncertainty.fit1complete.ER-Complete_with_uncertainty.fit1complete.horizonXER),'Facecolor',color_complete_LH)
hold on
errorbar(5,mean(Complete_with_uncertainty.fit1complete.ER-Complete_with_uncertainty.fit1complete.horizonXER),std(Complete_with_uncertainty.fit1complete.ER-Complete_with_uncertainty.fit1complete.horizonXER),'k','LineWidth',2)
box off
ylabel('EV regression weight')
xlabel('Choice type')
title('Figure S3 A')

subplot(2,2,2)
bar(1,mean(1./(Partial_with_uncertainty.fit1partial.ER+Partial_with_uncertainty.fit1partial.horizonXER)),'Facecolor',color_partial_SH)
hold on
errorbar(1,mean(1./(Partial_with_uncertainty.fit1partial.ER+Partial_with_uncertainty.fit1partial.horizonXER)),std(1./(Partial_with_uncertainty.fit1partial.ER+Partial_with_uncertainty.fit1partial.horizonXER)),'k','LineWidth',2)
hold on
bar(2,mean(1./(Partial_with_uncertainty.fit1partial.ER-Partial_with_uncertainty.fit1partial.horizonXER)),'Facecolor',color_partial_LH)
hold on
errorbar(2,mean(1./(Partial_with_uncertainty.fit1partial.ER-Partial_with_uncertainty.fit1partial.horizonXER)),std(1./(Partial_with_uncertainty.fit1partial.ER+Partial_with_uncertainty.fit1partial.horizonXER)),'k','LineWidth',2)
hold on
bar(4,mean(1./(Complete_with_uncertainty.fit1complete.ER+Complete_with_uncertainty.fit1complete.horizonXER)),'Facecolor',color_complete_SH)
hold on
errorbar(4,mean(1./(Complete_with_uncertainty.fit1complete.ER+Complete_with_uncertainty.fit1complete.horizonXER)),std(1./(Complete_with_uncertainty.fit1complete.ER+Complete_with_uncertainty.fit1complete.horizonXER)),'k','LineWidth',2)
hold on
bar(5,mean(1./(Complete_with_uncertainty.fit1complete.ER-Complete_with_uncertainty.fit1complete.horizonXER)),'Facecolor',color_complete_LH)
hold on
errorbar(5,mean(1./(Complete_with_uncertainty.fit1complete.ER-Complete_with_uncertainty.fit1complete.horizonXER)),std(1./(Complete_with_uncertainty.fit1complete.ER-1./Complete_with_uncertainty.fit1complete.horizonXER)),'k','LineWidth',2)
box off
ylabel('Softmax noise')
xlabel('Choice type')

subplot(2,2,3)
bar(1,mean(Partial_with_uncertainty.fit1partial.U+Partial_with_uncertainty.fit1partial.horizonXU),'Facecolor',color_partial_SH)
hold on
errorbar(1,mean(Partial_with_uncertainty.fit1partial.U+Partial_with_uncertainty.fit1partial.horizonXU),std(Partial_with_uncertainty.fit1partial.U+Partial_with_uncertainty.fit1partial.horizonXU),'k','LineWidth',2)
hold on
bar(2,mean(Partial_with_uncertainty.fit1partial.U-Partial_with_uncertainty.fit1partial.horizonXU),'Facecolor',color_partial_LH)
hold on
errorbar(2,mean(Partial_with_uncertainty.fit1partial.U-Partial_with_uncertainty.fit1partial.horizonXU),std(Partial_with_uncertainty.fit1partial.U+Partial_with_uncertainty.fit1partial.horizonXU),'k','LineWidth',2)
hold on
bar(4,mean(Complete_with_uncertainty.fit1complete.U+Complete_with_uncertainty.fit1complete.horizonXU),'Facecolor',color_complete_SH)
hold on
errorbar(4,mean(Complete_with_uncertainty.fit1complete.U+Complete_with_uncertainty.fit1complete.horizonXU),std(Complete_with_uncertainty.fit1complete.U+Complete_with_uncertainty.fit1complete.horizonXU),'k','LineWidth',2)
hold on
bar(5,mean(Complete_with_uncertainty.fit1complete.U-Complete_with_uncertainty.fit1complete.horizonXU),'Facecolor',color_complete_LH)
hold on
errorbar(5,mean(Complete_with_uncertainty.fit1complete.U-Complete_with_uncertainty.fit1complete.horizonXU),std(Complete_with_uncertainty.fit1complete.U-Complete_with_uncertainty.fit1complete.horizonXU),'k','LineWidth',2)
box off
ylabel('Uncertainty regression weight')
xlabel('Choice type')

subplot(2,2,4)
bar(1,mean((Partial_with_uncertainty.fit1partial.U+Partial_with_uncertainty.fit1partial.horizonXU)./(Partial_with_uncertainty.fit1partial.ER+Partial_with_uncertainty.fit1partial.horizonXER)),'Facecolor',color_partial_SH)
hold on
errorbar(1,mean((Partial_with_uncertainty.fit1partial.U+Partial_with_uncertainty.fit1partial.horizonXU)./(Partial_with_uncertainty.fit1partial.ER+Partial_with_uncertainty.fit1partial.horizonXER)),std((Partial_with_uncertainty.fit1partial.U+Partial_with_uncertainty.fit1partial.horizonXU)./(Partial_with_uncertainty.fit1partial.ER+Partial_with_uncertainty.fit1partial.horizonXER)),'k','LineWidth',2)
hold on
bar(2,mean((Partial_with_uncertainty.fit1partial.U-Partial_with_uncertainty.fit1partial.horizonXU)./(Partial_with_uncertainty.fit1partial.ER-Partial_with_uncertainty.fit1partial.horizonXER)),'Facecolor',color_partial_LH)
hold on
errorbar(2,mean((Partial_with_uncertainty.fit1partial.U-Partial_with_uncertainty.fit1partial.horizonXU)./(Partial_with_uncertainty.fit1partial.ER-Partial_with_uncertainty.fit1partial.horizonXER)),std((Partial_with_uncertainty.fit1partial.U+Partial_with_uncertainty.fit1partial.horizonXU)./(Partial_with_uncertainty.fit1partial.ER-Partial_with_uncertainty.fit1partial.horizonXER)),'k','LineWidth',2)
hold on
bar(4,mean((Complete_with_uncertainty.fit1complete.U+Complete_with_uncertainty.fit1complete.horizonXU)./(Complete_with_uncertainty.fit1complete.ER+Complete_with_uncertainty.fit1complete.horizonXER)),'Facecolor',color_complete_SH)
hold on
errorbar(4,mean((Complete_with_uncertainty.fit1complete.U+Complete_with_uncertainty.fit1complete.horizonXU)./(Complete_with_uncertainty.fit1complete.ER+Complete_with_uncertainty.fit1complete.horizonXER)),std((Complete_with_uncertainty.fit1complete.U+Complete_with_uncertainty.fit1complete.horizonXU)./(Complete_with_uncertainty.fit1complete.ER+Complete_with_uncertainty.fit1complete.horizonXER)),'k','LineWidth',2)
hold on
bar(5,mean((Complete_with_uncertainty.fit1complete.U-Complete_with_uncertainty.fit1complete.horizonXU)./(Complete_with_uncertainty.fit1complete.ER-Complete_with_uncertainty.fit1complete.horizonXER)),'Facecolor',color_complete_LH)
hold on
errorbar(5,mean((Complete_with_uncertainty.fit1complete.U-Complete_with_uncertainty.fit1complete.horizonXU)./(Complete_with_uncertainty.fit1complete.ER-Complete_with_uncertainty.fit1complete.horizonXER)),std((Complete_with_uncertainty.fit1complete.U-Complete_with_uncertainty.fit1complete.horizonXU)./(Complete_with_uncertainty.fit1complete.ER-Complete_with_uncertainty.fit1complete.horizonXER)),'k','LineWidth',2)
box off
ylabel('Uncertainty bonus')
xlabel('Choice type')

%% Stats

p_rand_with_uncertainty=sum(1./(Difference_with_uncertainty.fit1difference.ER)>0)/length(Difference_with_uncertainty.fit1difference.ER);
p_randxH_with_uncertainty=sum(1./(Difference_with_uncertainty.fit1difference.horizonXER)<0)/length(Difference_with_uncertainty.fit1difference.ER);

p_rand_part_with_uncertainty=sum(1./(Partial_with_uncertainty.fit1partial.horizonXER)<0)/length(Partial_with_uncertainty.fit1partial.ER);

%% Fit with available info (same as Wilson et al. 2014)

%Fit first choice
Complete_with_available_info=load('fit1availableinfocomplete.mat');
Partial_with_available_info=load('fit1availableinfopartial.mat');
Difference_with_available_info=load('fit1availableinfodifference.mat');


%% Figure S3

figure
subplot(2,2,1)
bar(1,mean(Partial_with_available_info.fit1availableInfopartial.ER+Partial_with_available_info.fit1availableInfopartial.horizonXER),'Facecolor',color_partial_SH)
hold on
errorbar(1,mean(Partial_with_available_info.fit1availableInfopartial.ER+Partial_with_available_info.fit1availableInfopartial.horizonXER),std(Partial_with_available_info.fit1availableInfopartial.ER+Partial_with_available_info.fit1availableInfopartial.horizonXER),'k','LineWidth',2)
hold on
bar(2,mean(Partial_with_available_info.fit1availableInfopartial.ER-Partial_with_available_info.fit1availableInfopartial.horizonXER),'Facecolor',color_partial_LH)
hold on
errorbar(2,mean(Partial_with_available_info.fit1availableInfopartial.ER-Partial_with_available_info.fit1availableInfopartial.horizonXER),std(Partial_with_available_info.fit1availableInfopartial.ER+Partial_with_available_info.fit1availableInfopartial.horizonXER),'k','LineWidth',2)
hold on
bar(4,mean(Complete_with_available_info.fit1availableInfocomplete.ER+Complete_with_available_info.fit1availableInfocomplete.horizonXER),'Facecolor',color_complete_SH)
hold on
errorbar(4,mean(Complete_with_available_info.fit1availableInfocomplete.ER+Complete_with_available_info.fit1availableInfocomplete.horizonXER),std(Complete_with_available_info.fit1availableInfocomplete.ER+Complete_with_available_info.fit1availableInfocomplete.horizonXER),'k','LineWidth',2)
hold on
bar(5,mean(Complete_with_available_info.fit1availableInfocomplete.ER-Complete_with_available_info.fit1availableInfocomplete.horizonXER),'Facecolor',color_complete_LH)
hold on
errorbar(5,mean(Complete_with_available_info.fit1availableInfocomplete.ER-Complete_with_available_info.fit1availableInfocomplete.horizonXER),std(Complete_with_available_info.fit1availableInfocomplete.ER-Complete_with_available_info.fit1availableInfocomplete.horizonXER),'k','LineWidth',2)
box off
ylabel('EV regression weight')
xlabel('Choice type')
title('Figure S3 B')

subplot(2,2,2)
bar(1,mean(1./(Partial_with_available_info.fit1availableInfopartial.ER+Partial_with_available_info.fit1availableInfopartial.horizonXER)),'Facecolor',color_partial_SH)
hold on
errorbar(1,mean(1./(Partial_with_available_info.fit1availableInfopartial.ER+Partial_with_available_info.fit1availableInfopartial.horizonXER)),std(1./(Partial_with_available_info.fit1availableInfopartial.ER+Partial_with_available_info.fit1availableInfopartial.horizonXER)),'k','LineWidth',2)
hold on
bar(2,mean(1./(Partial_with_available_info.fit1availableInfopartial.ER-Partial_with_available_info.fit1availableInfopartial.horizonXER)),'Facecolor',color_partial_LH)
hold on
errorbar(2,mean(1./(Partial_with_available_info.fit1availableInfopartial.ER-Partial_with_available_info.fit1availableInfopartial.horizonXER)),std(1./(Partial_with_available_info.fit1availableInfopartial.ER+Partial_with_available_info.fit1availableInfopartial.horizonXER)),'k','LineWidth',2)
hold on
bar(4,mean(1./(Complete_with_available_info.fit1availableInfocomplete.ER+Complete_with_available_info.fit1availableInfocomplete.horizonXER)),'Facecolor',color_complete_SH)
hold on
errorbar(4,mean(1./(Complete_with_available_info.fit1availableInfocomplete.ER+Complete_with_available_info.fit1availableInfocomplete.horizonXER)),std(1./(Complete_with_available_info.fit1availableInfocomplete.ER+Complete_with_available_info.fit1availableInfocomplete.horizonXER)),'k','LineWidth',2)
hold on
bar(5,mean(1./(Complete_with_available_info.fit1availableInfocomplete.ER-Complete_with_available_info.fit1availableInfocomplete.horizonXER)),'Facecolor',color_complete_LH)
hold on
errorbar(5,mean(1./(Complete_with_available_info.fit1availableInfocomplete.ER-Complete_with_available_info.fit1availableInfocomplete.horizonXER)),std(1./(Complete_with_available_info.fit1availableInfocomplete.ER-1./Complete_with_available_info.fit1availableInfocomplete.horizonXER)),'k','LineWidth',2)
box off
ylabel('Softmax noise')
xlabel('Choice type')

subplot(2,2,3)
bar(1,mean(Partial_with_available_info.fit1availableInfopartial.availableInfo+Partial_with_available_info.fit1availableInfopartial.horizonXavailableInfo),'Facecolor',color_partial_SH)
hold on
errorbar(1,mean(Partial_with_available_info.fit1availableInfopartial.availableInfo+Partial_with_available_info.fit1availableInfopartial.horizonXavailableInfo),std(Partial_with_available_info.fit1availableInfopartial.availableInfo+Partial_with_available_info.fit1availableInfopartial.horizonXavailableInfo),'k','LineWidth',2)
hold on
bar(2,mean(Partial_with_available_info.fit1availableInfopartial.availableInfo-Partial_with_available_info.fit1availableInfopartial.horizonXavailableInfo),'Facecolor',color_partial_LH)
hold on
errorbar(2,mean(Partial_with_available_info.fit1availableInfopartial.availableInfo-Partial_with_available_info.fit1availableInfopartial.horizonXavailableInfo),std(Partial_with_available_info.fit1availableInfopartial.availableInfo+Partial_with_available_info.fit1availableInfopartial.horizonXavailableInfo),'k','LineWidth',2)
hold on
bar(4,mean(Complete_with_available_info.fit1availableInfocomplete.availableInfo+Complete_with_available_info.fit1availableInfocomplete.horizonXavailableInfo),'Facecolor',color_complete_SH)
hold on
errorbar(4,mean(Complete_with_available_info.fit1availableInfocomplete.availableInfo+Complete_with_available_info.fit1availableInfocomplete.horizonXavailableInfo),std(Complete_with_available_info.fit1availableInfocomplete.availableInfo+Complete_with_available_info.fit1availableInfocomplete.horizonXavailableInfo),'k','LineWidth',2)
hold on
bar(5,mean(Complete_with_available_info.fit1availableInfocomplete.availableInfo-Complete_with_available_info.fit1availableInfocomplete.horizonXavailableInfo),'Facecolor',color_complete_LH)
hold on
errorbar(5,mean(Complete_with_available_info.fit1availableInfocomplete.availableInfo-Complete_with_available_info.fit1availableInfocomplete.horizonXavailableInfo),std(Complete_with_available_info.fit1availableInfocomplete.availableInfo-Complete_with_available_info.fit1availableInfocomplete.horizonXavailableInfo),'k','LineWidth',2)
box off
ylabel('Info regression weight')
xlabel('Choice type')

subplot(2,2,4)
bar(1,mean((Partial_with_available_info.fit1availableInfopartial.availableInfo+Partial_with_available_info.fit1availableInfopartial.horizonXavailableInfo)./(Partial_with_available_info.fit1availableInfopartial.ER+Partial_with_available_info.fit1availableInfopartial.horizonXER)),'Facecolor',color_partial_SH)
hold on
errorbar(1,mean((Partial_with_available_info.fit1availableInfopartial.availableInfo+Partial_with_available_info.fit1availableInfopartial.horizonXavailableInfo)./(Partial_with_available_info.fit1availableInfopartial.ER+Partial_with_available_info.fit1availableInfopartial.horizonXER)),std((Partial_with_available_info.fit1availableInfopartial.availableInfo+Partial_with_available_info.fit1availableInfopartial.horizonXavailableInfo)./(Partial_with_available_info.fit1availableInfopartial.ER+Partial_with_available_info.fit1availableInfopartial.horizonXER)),'k','LineWidth',2)
hold on
bar(2,mean((Partial_with_available_info.fit1availableInfopartial.availableInfo-Partial_with_available_info.fit1availableInfopartial.horizonXavailableInfo)./(Partial_with_available_info.fit1availableInfopartial.ER-Partial_with_available_info.fit1availableInfopartial.horizonXER)),'Facecolor',color_partial_LH)
hold on
errorbar(2,mean((Partial_with_available_info.fit1availableInfopartial.availableInfo-Partial_with_available_info.fit1availableInfopartial.horizonXavailableInfo)./(Partial_with_available_info.fit1availableInfopartial.ER-Partial_with_available_info.fit1availableInfopartial.horizonXER)),std((Partial_with_available_info.fit1availableInfopartial.availableInfo+Partial_with_available_info.fit1availableInfopartial.horizonXavailableInfo)./(Partial_with_available_info.fit1availableInfopartial.ER-Partial_with_available_info.fit1availableInfopartial.horizonXER)),'k','LineWidth',2)
hold on
bar(4,mean((Complete_with_available_info.fit1availableInfocomplete.availableInfo+Complete_with_available_info.fit1availableInfocomplete.horizonXavailableInfo)./(Complete_with_available_info.fit1availableInfocomplete.ER+Complete_with_available_info.fit1availableInfocomplete.horizonXER)),'Facecolor',color_complete_SH)
hold on
errorbar(4,mean((Complete_with_available_info.fit1availableInfocomplete.availableInfo+Complete_with_available_info.fit1availableInfocomplete.horizonXavailableInfo)./(Complete_with_available_info.fit1availableInfocomplete.ER+Complete_with_available_info.fit1availableInfocomplete.horizonXER)),std((Complete_with_available_info.fit1availableInfocomplete.availableInfo+Complete_with_available_info.fit1availableInfocomplete.horizonXavailableInfo)./(Complete_with_available_info.fit1availableInfocomplete.ER+Complete_with_available_info.fit1availableInfocomplete.horizonXER)),'k','LineWidth',2)
hold on
bar(5,mean((Complete_with_available_info.fit1availableInfocomplete.availableInfo-Complete_with_available_info.fit1availableInfocomplete.horizonXavailableInfo)./(Complete_with_available_info.fit1availableInfocomplete.ER-Complete_with_available_info.fit1availableInfocomplete.horizonXER)),'Facecolor',color_complete_LH)
hold on
errorbar(5,mean((Complete_with_available_info.fit1availableInfocomplete.availableInfo-Complete_with_available_info.fit1availableInfocomplete.horizonXavailableInfo)./(Complete_with_available_info.fit1availableInfocomplete.ER-Complete_with_available_info.fit1availableInfocomplete.horizonXER)),std((Complete_with_available_info.fit1availableInfocomplete.availableInfo-Complete_with_available_info.fit1availableInfocomplete.horizonXavailableInfo)./(Complete_with_available_info.fit1availableInfocomplete.ER-Complete_with_available_info.fit1availableInfocomplete.horizonXER)),'k','LineWidth',2)
box off
ylabel('Info bonus')
xlabel('Choice type')


%% Stats

p_rand_with_available_info=sum(1./(Difference_with_available_info.fit1availableInfodifference.ER)>0)/length(Difference_with_available_info.fit1availableInfodifference.ER);
p_randxER_available_info=sum(1./(Difference_with_available_info.fit1availableInfodifference.horizonXER)<0)/length(Difference_with_available_info.fit1availableInfodifference.ER);

p_rand_part_available_info=sum(1./(Partial_with_available_info.fit1availableInfopartial.horizonXER)<0)/length(Partial_with_available_info.fit1availableInfopartial.ER);




