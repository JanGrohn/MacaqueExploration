%colors
color_partial_SH=[88 172 204]./255;
color_partial_LH=[20 116 153]./255;
color_complete_SH=[225 169 158]./255;
color_complete_LH=[204 88 111]./255;

color_partial=(color_partial_SH+color_partial_LH)./2;
color_complete=(color_complete_SH+color_complete_LH)./2;

%% Figure 4B

load('Fig4B.mat')


figure


for ii = 1:3
    subplot(1,3,ii);hold on
    if ii==1
        title('Fig 4B: pgACC (24)')
    elseif ii==2
        title('Fig 4B: dlPFC (46)')
    else
        title('Fig 4B: lOFC (47/12o)')
    end
    for c = 1:2
        bar(c+0.2,nanmean(complete{ii}(:,c)),0.4,'FaceColor',color_complete)
        hold on
        bar(c-0.2,nanmean(partial{ii}(:,c)),0.4,'FaceColor',color_partial)
        errorbar(c+0.2,nanmean(complete{ii}(:,c)),std(complete{ii}(~isnan(complete{ii}(:,c)),c))/sqrt(sum(~isnan(complete{ii}(:,c)))),'k','linewidth',1,'capsize',0)
        hold on
        errorbar(c-0.2,nanmean(partial{ii}(:,c)),std(partial{ii}(~isnan(partial{ii}(:,c)),c))/sqrt(sum(~isnan(partial{ii}(:,c)))),'k','linewidth',1,'capsize',0)
        
        hold on
        
    end
    
    data_for_anova=vertcat(complete{ii}(~isnan(complete{ii}(:,1)),1),complete{ii}(~isnan(complete{ii}(:,2)),2),partial{ii}(~isnan(partial{ii}(:,1)),1),partial{ii}(~isnan(partial{ii}(:,2)),2));
    group_for_anova(:,1)=vertcat(ones(sum(~isnan(complete{ii}(:,1))),1),ones(sum(~isnan(complete{ii}(:,2))),1),2*ones(sum(~isnan(partial{ii}(:,1))),1),2*ones(sum(~isnan(partial{ii}(:,2))),1));
    group_for_anova(:,2)=vertcat(ones(sum(~isnan(complete{ii}(:,1))),1),2*ones(sum(~isnan(complete{ii}(:,2))),1),ones(sum(~isnan(partial{ii}(:,1))),1),2*ones(sum(~isnan(partial{ii}(:,2))),1));
    
    [p b t]=anovan(data_for_anova,{group_for_anova(:,1),group_for_anova(:,2)},'model','interaction','varnames',{'feedback','horizon'});
    
    clear *_for_anova
        
    xticks(1:2)
    xtickangle(45)
    xticklabels({'Short horizon','Long horizon'})
    ylabel('T-stat')
    
end

%% Figure 4D

load('Fig4D.mat')


figure; hold on

for ii = 1
    
    subplot(1,2,ii);hold on
    title('Fig 4D: MCC (24)')
    for c = 1
        bar(c+0.2,nanmean(complete(:,c)),0.4,'FaceColor',color_complete)
   
        bar(c-0.2,nanmean(partial(:,c)),0.4,'FaceColor',color_partial)
  
        errorbar(c+0.2,nanmean(complete(:,c)),std(complete(~isnan(complete(:,c)),c))/sqrt(sum(~isnan(complete(:,c)))),'k','linewidth',1,'capsize',0)
        errorbar(c-0.2,nanmean(partial(:,c)),std(partial(~isnan(partial(:,c)),c))/sqrt(sum(~isnan(partial(:,c)))),'k','linewidth',1,'capsize',0)    
    end
    xticks(1)
    xticklabels({'Main effect'})
    ylim([-0.1 0.8])
    set(gca,'FontSize',20)
    ylabel('T-stat')
end


%% Figure 4E

load('Fig4E.mat')

copeIDs = [107 109 91 93 41 111 113 85 87 95 81 79 61 59 57 55 34 33 165 163 139];


figure; hold on

for ii = 1:2
    
    subplot(1,2,ii);hold on
    if ii==1
        title('Fig 4E: MCC (24)')
    else
        title('Fig 4E: dlPFC (46)')
    end
    for c = 1
        bar(c+0.2,nanmean(complete{ii}(:,c)),0.4,'FaceColor',color_complete)
        hold on
        bar(c-0.2,nanmean(partial{ii}(:,c)),0.4,'FaceColor',color_partial)
        errorbar(c+0.2,nanmean(complete{ii}(:,c)),std(complete{ii}(~isnan(complete{ii}(:,c)),c))/sqrt(sum(~isnan(complete{ii}(:,c)))),'k','linewidth',1,'capsize',0)
        hold on
        errorbar(c-0.2,nanmean(partial{ii}(:,c)),std(partial{ii}(~isnan(partial{ii}(:,c)),c))/sqrt(sum(~isnan(partial{ii}(:,c)))),'k','linewidth',1,'capsize',0)
        
        hold on
        
    end
    xticks(1:2)
    xticklabels({'EV chosen'})
    ylabel('T-stat')
    ylim([-0.5 0.5])
    set(gca,'FontSize',20)
end



%% Figure 5C
load('Fig5C.mat')

figure


for ii = 1:3
    subplot(1,3,ii);hold on

    if ii==1
        title('Fig 5C: SSC (3)')
    elseif ii==2
        title('Fig 5C: vlPFC (45)')
    else
        title('Fig 5C: lOFC (47/12o)')
    end
    for c = 1:4
        bar(c,nanmean(complete_unch{ii}(:,c)),0.8,'FaceColor',color_complete)
        [h_c_c(ii,c), p_c_c(ii,c), ~, s]=ttest(complete_unch{ii}(:,c));
        t_c_c(ii,c)=s.tstat;
        df_c_c(ii,c)=s.df;
        errorbar(c,nanmean(complete_unch{ii}(:,c)),std(complete_unch{ii}(~isnan(complete_unch{ii}(:,c)),c))/sqrt(sum(~isnan(complete_unch{ii}(:,c)))),'k','linewidth',1,'capsize',0)

    end
    xticks(1:4)
    xtickangle(45)
    xticklabels({'Chosen expectation','Chosen outcome','Unchosen expectation','Unchosen outcome'})
    ylim([-0.8 0.8])
    ylabel('T-stat')
    
end



%% Figure 5D

load('Fig5D')

figure

for ii = 1:3
    subplot(1,3,ii)
    hold on
    if ii==1
        title('Fig 5D: mOFC (14)')
    elseif ii==2
        title('Fig 5D: vmPFC (10mc/14m)')
    else
        title('Fig 5D: cOFC (13)')
    end
    
    for c = 1:4
        bar(c,nanmean(complete_unch{ii}(:,c)),0.8,'FaceColor',color_complete)
        [h_u_c(ii,c), p_u_c(ii,c), ~, s]=ttest(complete_unch{ii}(:,c));
        t_u_c(ii,c)=s.tstat;
        df_u_c(ii,c)=s.df;
        
        errorbar(c,nanmean(complete_unch{ii}(:,c)),std(complete_unch{ii}(~isnan(complete_unch{ii}(:,c)),c))/sqrt(sum(~isnan(complete_unch{ii}(:,c)))),'k','linewidth',1,'capsize',0)
    end
    xticks(1:4)
    xtickangle(45)
    xticklabels({'Chosen expectation','Chosen outcome','Unchosen expectation','Unchosen outcome'})
    ylim([-0.6 0.5])
    
end


%% Figure 5B

load('data')
load('Fig5B')

complete_dER = nan(length(dat),1);
complete_dERc = nan(length(dat),1);


for sess = 1:length(dat)
    if dat(sess,3)==1
        I=(dataTable.monkey==dat(sess,1) & dataTable.session==dat(sess,2) & dataTable.condition==dat(sess,3) & dataTable.exclude==0 & dataTable.choice_num>1);
        y=dataTable.rightChoice(I);
        X=[dataTable.baselineER(I),...
            dataTable.baselineU(I),...
            dataTable.deltaERchosen(I),...
            dataTable.deltaERcounterfactual(I),...
            dataTable.deltaUchosen(I),...
            dataTable.deltaUcounterfactual(I),...
            dataTable.baselineAvailableInfo(I),...
            dataTable.deltaChosen(I),...
            (dataTable.RB(I))];
        X=zscore(X,0,1);
        mdl=fitglm(X,y,'Distribution','binomial');
        complete_dER(sess)=mdl.Coefficients.tStat(4);
        complete_dERc(sess)=mdl.Coefficients.tStat(5);
    end
end

IDs_PE = [13 27];


for ii = 1
    figure
    subplot(1,2,1)
    scatter(complete_dER,complete_ch(:,1),25,color_complete,'filled')
    [b,~,s]=glmfit(complete_dER,complete_ch(:,1));
    hold on
    plot(-1:4,b(1)+b(2).*[-1:4],'Color',color_complete,'Linewidth',2)
    if b(2)<0
        title(sprintf('%s p = %0.3g','vmPFC (10mc/14m)',s.p(2)/2))
    elseif b(2)>=0
        title(sprintf('%s p = %0.3g','vmPFC (10mc/14m)',1-s.p(2)/2))
    end
    ylabel('T-stats chosen PE (neural')
    xlabel('T-stat delta EVchosen (bhv)')
    
    subplot(1,2,2)
    scatter(complete_dERc,complete_ch(:,2),25,color_complete,'filled')
    [b,~,s]=glmfit(complete_dERc,complete_ch(:,2));
    hold on
    plot(-2:3,b(1)+b(2).*[-2:3],'Color',color_complete,'Linewidth',2)
    
    if b(2)<0
        title(sprintf('dERc & PEunchosen p = %0.3g',s.p(2)/2))
    elseif b(2)>=0
        title(sprintf('dERc & PEunchosen p = %0.3g',1-s.p(2)/2))
    end
    ylabel('T-stats unchosen PE (neural')
    xlabel('T-stat delta EVunchosen (bhv)')
    
end


