%Colors
color_partial_SH=[88 172 204]./255;
color_partial_LH=[20 116 153]./255;
color_complete_SH=[225 169 158]./255;
color_complete_LH=[204 88 111]./255;

color_partial=(color_partial_SH+color_partial_LH)./2;
color_complete=(color_complete_SH+color_complete_LH)./2;

color_combined=(color_partial+color_complete)./2;
color_difference=(color_partial+color_complete)./2;

% Behaviour
load('data.mat')

% Fit first choice
Complete=load('fit1complete.mat');
Partial=load('fit1partial.mat');
Combined=load('fit1combined.mat');
Difference=load('fit1difference.mat');

% Fit subsequent choices
Complete1=load('fit2complete.mat');
Partial1=load('fit2partial.mat');
Difference1=load('fit2difference.mat');

%% Figure 2B: accuracy on first choice

%find the number of sessions for each type of session

N_sess_M_counterfactual(1)=min(dataTable.session(dataTable.name(:)=='M' & dataTable.condition(:)==1));
N_sess_M_counterfactual(2)=max(dataTable.session(dataTable.name(:)=='M' & dataTable.condition(:)==1));
N_sess_S_counterfactual(1)=min(dataTable.session(dataTable.name(:)=='S' & dataTable.condition(:)==1));
N_sess_S_counterfactual(2)=max(dataTable.session(dataTable.name(:)=='S' & dataTable.condition(:)==1));
N_sess_E_counterfactual(1)=min(dataTable.session(dataTable.name(:)=='E' & dataTable.condition(:)==1));
N_sess_E_counterfactual(2)=max(dataTable.session(dataTable.name(:)=='E' & dataTable.condition(:)==1));

N_sess_M_partial(1)=min(dataTable.session(dataTable.name(:)=='M' & dataTable.condition(:)==2));
N_sess_M_partial(2)=max(dataTable.session(dataTable.name(:)=='M' & dataTable.condition(:)==2));
N_sess_S_partial(1)=min(dataTable.session(dataTable.name(:)=='S' & dataTable.condition(:)==2));
N_sess_S_partial(2)=max(dataTable.session(dataTable.name(:)=='S' & dataTable.condition(:)==2));
N_sess_E_partial(1)=min(dataTable.session(dataTable.name(:)=='E' & dataTable.condition(:)==2));
N_sess_E_partial(2)=max(dataTable.session(dataTable.name(:)=='E' & dataTable.condition(:)==2));

%Counterfactual feedback
%M
for n=N_sess_M_counterfactual(1):N_sess_M_counterfactual(2)
    Acc_M_short_counterfactual(n-N_sess_M_counterfactual(1)+1)=nanmean(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n));
    Acc_sem_M_short_counterfactual(n-N_sess_M_counterfactual(1)+1)=nanstd(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n)-1);
    for j=1:4
        Acc_M_long_counterfactual(j,n-N_sess_M_counterfactual(1)+1)=nanmean(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n));
        Acc_sem_M_long_counterfactual(j,n-N_sess_M_counterfactual(1)+1)=nanstd(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n)-1);
    end
end
%S
for n=N_sess_S_counterfactual(1):N_sess_S_counterfactual(2)
    Acc_S_short_counterfactual(n-N_sess_S_counterfactual(1)+1)=nanmean(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n));
    Acc_sem_S_short_counterfactual(n-N_sess_S_counterfactual(1)+1)=nanstd(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n)-1);
    for j=1:4
        Acc_S_long_counterfactual(j,n-N_sess_S_counterfactual(1)+1)=nanmean(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n));
        Acc_sem_S_long_counterfactual(j,n-N_sess_S_counterfactual(1)+1)=nanstd(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n)-1);
    end
end
%E
for n=N_sess_E_counterfactual(1):N_sess_E_counterfactual(2)
    Acc_E_short_counterfactual(n-N_sess_E_counterfactual(1)+1)=nanmean(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n));
    Acc_sem_E_short_counterfactual(n-N_sess_E_counterfactual(1)+1)=nanstd(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n)-1);
    for j=1:4
        Acc_E_long_counterfactual(j,n-N_sess_E_counterfactual(1)+1)=nanmean(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n));
        Acc_sem_E_long_counterfactual(j,n-N_sess_E_counterfactual(1)+1)=nanstd(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n)-1);
    end
end

%Partial feedback
%M
for n=N_sess_M_partial(1):N_sess_M_partial(2)
    Acc_M_short_partial(n-N_sess_M_partial(1)+1)=nanmean(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n));
    Acc_sem_M_short_partial(n-N_sess_M_partial(1)+1)=nanstd(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='M' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n)-1);
    for j=1:4
        Acc_M_long_partial(j,n-N_sess_M_partial(1)+1)=nanmean(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n));
        Acc_sem_M_long_partial(j,n-N_sess_M_partial(1)+1)=nanstd(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='M' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n)-1);
    end
end
%S
for n=N_sess_S_partial(1):N_sess_S_partial(2)
    Acc_S_short_partial(n-N_sess_S_partial(1)+1)=nanmean(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n));
    Acc_sem_S_short_partial(n-N_sess_S_partial(1)+1)=nanstd(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='S' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n)-1);
    for j=1:4
        Acc_S_long_partial(j,n-N_sess_S_partial(1)+1)=nanmean(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n));
        Acc_sem_S_long_partial(j,n-N_sess_S_partial(1)+1)=nanstd(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='S' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n)-1);
    end
end
%E
for n=N_sess_E_partial(1):N_sess_E_partial(2)
    Acc_E_short_partial(n-N_sess_E_partial(1)+1)=nanmean(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n));
    Acc_sem_E_short_partial(n-N_sess_E_partial(1)+1)=nanstd(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='E' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n)-1);
    for j=1:4
        Acc_E_long_partial(j,n-N_sess_E_partial(1)+1)=nanmean(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n));
        Acc_sem_E_long_partial(j,n-N_sess_E_partial(1)+1)=nanstd(dataTable.accuracy(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='E' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n)-1);
    end
end

Acc_all_short_counterfactual=horzcat(Acc_M_short_counterfactual,Acc_S_short_counterfactual,Acc_E_short_counterfactual);
Acc_all_short_partial=horzcat(Acc_M_short_partial,Acc_S_short_partial,Acc_E_short_partial);

Acc_all_long_counterfactual=horzcat(Acc_M_long_counterfactual,Acc_S_long_counterfactual,Acc_E_long_counterfactual);
Acc_all_long_partial=horzcat(Acc_M_long_partial,Acc_S_long_partial,Acc_E_long_partial);

figure
errorbar(2,mean(Acc_all_short_counterfactual),std(Acc_all_short_counterfactual)/sqrt(length(Acc_all_short_counterfactual)-1),'o','Color',color_complete_SH,'LineWidth',2)
hold on
errorbar(2.25,mean(Acc_all_long_counterfactual(1,:),2),std(Acc_all_long_counterfactual(1,:),0,2)/sqrt(length(Acc_all_short_counterfactual)-1),'o','Color',color_complete_LH,'LineWidth',2)
hold on
errorbar(1,mean(Acc_all_short_partial),std(Acc_all_short_partial)/sqrt(length(Acc_all_short_partial)-1),'o','Color',color_partial_SH,'LineWidth',2)
hold on
errorbar(1.25,mean(Acc_all_long_partial(1,:),2),std(Acc_all_long_partial(1,:),0,2)/sqrt(length(Acc_all_short_partial)-1),'o','Color',color_partial_LH,'LineWidth',2)
ylim([0.6 0.75])
xlim([0 3])
title('Figure 2B')
ylabel('P(highest EV chosen')
xlabel('Choice type')
box off

%% Figure 3A: accuracy in the sequence

x=1.25:1:4.25;

figure
errorbar(x,mean(Acc_all_long_counterfactual,2),std(Acc_all_long_counterfactual,0,2)/sqrt(length(Acc_all_short_counterfactual)-1),'o','Color',color_complete_LH,'LineWidth',2)
hold on
errorbar(mean(Acc_all_long_partial,2),std(Acc_all_long_partial,0,2)/sqrt(length(Acc_all_short_partial)-1),'o','Color',color_partial_LH,'LineWidth',2)
xlim([0 5])
ylim([0.6 0.85])
title('all')
box off
ylabel('P(highest EV chosen)')
xlabel('Choice #')
title('Figure 3A')

%% Figure 3D: repetition 

%M
for n=N_sess_M_counterfactual(1):N_sess_M_counterfactual(2)
    Corr_M_short_counterfactual(n-N_sess_M_counterfactual(1)+1)=nanmean(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n));
    Corr_sem_M_short_counterfactual(n-N_sess_M_counterfactual(1)+1)=nanstd(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n)-1);
    for j=1:4
        Corr_M_long_counterfactual(j,n-N_sess_M_counterfactual(1)+1)=nanmean(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n));
        Corr_sem_M_long_counterfactual(j,n-N_sess_M_counterfactual(1)+1)=nanstd(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n)-1);
    end
end
%S
for n=N_sess_S_counterfactual(1):N_sess_S_counterfactual(2)
    Corr_S_short_counterfactual(n-N_sess_S_counterfactual(1)+1)=nanmean(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n));
    Corr_sem_S_short_counterfactual(n-N_sess_S_counterfactual(1)+1)=nanstd(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n)-1);
    for j=1:4
        Corr_S_long_counterfactual(j,n-N_sess_S_counterfactual(1)+1)=nanmean(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n));
        Corr_sem_S_long_counterfactual(j,n-N_sess_S_counterfactual(1)+1)=nanstd(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n)-1);
    end
end
%E
for n=N_sess_E_counterfactual(1):N_sess_E_counterfactual(2)
    Corr_E_short_counterfactual(n-N_sess_E_counterfactual(1)+1)=nanmean(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n));
    Corr_sem_E_short_counterfactual(n-N_sess_E_counterfactual(1)+1)=nanstd(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n)-1);
    for j=1:4
        Corr_E_long_counterfactual(j,n-N_sess_E_counterfactual(1)+1)=nanmean(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n));
        Corr_sem_E_long_counterfactual(j,n-N_sess_E_counterfactual(1)+1)=nanstd(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n)-1);
    end
end

%M
for n=N_sess_M_partial(1):N_sess_M_partial(2)
    Corr_M_short_partial(n-N_sess_M_partial(1)+1)=nanmean(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n));
    Corr_sem_M_short_partial(n-N_sess_M_partial(1)+1)=nanstd(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='M' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n)-1);
    for j=1:4
        Corr_M_long_partial(j,n-N_sess_M_partial(1)+1)=nanmean(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n));
        Corr_sem_M_long_partial(j,n-N_sess_M_partial(1)+1)=nanstd(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='M' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n)-1);
    end
end
%S
for n=N_sess_S_partial(1):N_sess_S_partial(2)
    Corr_S_short_partial(n-N_sess_S_partial(1)+1)=nanmean(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n));
    Corr_sem_S_short_partial(n-N_sess_S_partial(1)+1)=nanstd(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='S' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n)-1);
    for j=1:4
        Corr_S_long_partial(j,n-N_sess_S_partial(1)+1)=nanmean(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n));
        Corr_sem_S_long_partial(j,n-N_sess_S_partial(1)+1)=nanstd(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='S' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n)-1);
    end
end
%E
for n=N_sess_E_partial(1):N_sess_E_partial(2)
    Corr_E_short_partial(n-N_sess_E_partial(1)+1)=nanmean(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n));
    Corr_sem_E_short_partial(n-N_sess_E_partial(1)+1)=nanstd(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='E' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1 & dataTable.horizon(:)==1 & dataTable.session(:)==n)-1);
    for j=1:4
        Corr_E_long_partial(j,n-N_sess_E_partial(1)+1)=nanmean(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n));
        Corr_sem_E_long_partial(j,n-N_sess_E_partial(1)+1)=nanstd(dataTable.sameAsBefore(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n))/sqrt(sum(dataTable.name(:)=='E' & dataTable.condition(:)==2 & dataTable.choice_num(:)==j & dataTable.horizon(:)==-1 & dataTable.session(:)==n)-1);
    end
end


Corr_all_short_counterfactual=horzcat(Corr_M_short_counterfactual,Corr_S_short_counterfactual,Corr_E_short_counterfactual);
Corr_all_short_partial=horzcat(Corr_M_short_partial,Corr_S_short_partial,Corr_E_short_partial);

Corr_all_long_counterfactual=horzcat(Corr_M_long_counterfactual,Corr_S_long_counterfactual,Corr_E_long_counterfactual);
Corr_all_long_partial=horzcat(Corr_M_long_partial,Corr_S_long_partial,Corr_E_long_partial);
 
figure
errorbar(x,mean(Corr_all_long_counterfactual,2),std(Corr_all_long_counterfactual,0,2)/sqrt(length(Corr_all_short_counterfactual)-1),'+','Color',color_complete_LH,'LineWidth',2)
hold on
errorbar(mean(Corr_all_long_partial,2),std(Corr_all_long_partial,0,2)/sqrt(length(Acc_all_short_partial)-1),'+','Color',color_partial_LH,'LineWidth',2)
xlim([0 5])
title('Figure 3D')
ylabel('P(same choice)')
xlabel('Choice #')

box off

%% Figure 2C: EV effect
%M
for k=-4:4
    for n=N_sess_M_counterfactual(1):N_sess_M_counterfactual(2)
        RC_M_counterfactual(k+5,n-N_sess_M_counterfactual(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1  & dataTable.session(:)==n & (dataTable.ER_right(:)-dataTable.ER_left(:))==k));
    end
end
%S
for k=-4:4
    for n=N_sess_S_counterfactual(1):N_sess_S_counterfactual(2)
        RC_S_counterfactual(k+5,n-N_sess_S_counterfactual(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1  & dataTable.session(:)==n & (dataTable.ER_right(:)-dataTable.ER_left(:))==k));
    end
end
%E
for k=-4:4
    for n=N_sess_E_counterfactual(1):N_sess_E_counterfactual(2)
        RC_E_counterfactual(k+5,n-N_sess_E_counterfactual(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)==1  & dataTable.session(:)==n & (dataTable.ER_right(:)-dataTable.ER_left(:))==k));
    end
end

%M
for k=-4:4
    for n=N_sess_M_partial(1):N_sess_M_partial(2)
        RC_M_partial(k+5,n-N_sess_M_partial(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1  & dataTable.session(:)==n & (dataTable.ER_right(:)-dataTable.ER_left(:))==k));
    end
end
%S
for k=-4:4
    for n=N_sess_S_partial(1):N_sess_S_partial(2)
        RC_S_partial(k+5,n-N_sess_S_partial(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1  & dataTable.session(:)==n & (dataTable.ER_right(:)-dataTable.ER_left(:))==k));
    end
end
%E
for k=-4:4
    for n=N_sess_E_partial(1):N_sess_E_partial(2)
        RC_E_partial(k+5,n-N_sess_E_partial(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==2 & dataTable.choice_num(:)==1  & dataTable.session(:)==n & (dataTable.ER_right(:)-dataTable.ER_left(:))==k));
    end
end

RC_all_counterfactual=horzcat(RC_M_counterfactual,RC_S_counterfactual,RC_E_counterfactual);
RC_all_partial=horzcat(RC_M_partial,RC_S_partial,RC_E_partial);
x_rc=-4:1:4;
RC_all=horzcat(RC_all_counterfactual,RC_all_partial);

figure
errorbar(x_rc,nanmean(RC_all,2),nanstd(RC_all,0,2)./sqrt(sum(~isnan(RC_all),2)-1),'-','Color','k','LineWidth',2)
ylabel('P(right option chosen)')
xlabel('Delta EV')
title('Figure 2C')
xlim([-5 5])
ylim([0 1])
box off

%% Figure 3B & C

%Counterfactual feedback sessions
%M
for k=-2:2
    for n=N_sess_M_counterfactual(1):N_sess_M_counterfactual(2)
        DeltaER_M_short_counterfactual(k+3,n-N_sess_M_counterfactual(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)>1 & dataTable.horizon(:)==1 & dataTable.session(:)==n & dataTable.deltaERchosen==k));
        DeltaER_M_long_counterfactual(k+3,n-N_sess_M_counterfactual(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)>1 & dataTable.horizon(:)==-1 & dataTable.session(:)==n  & dataTable.deltaERchosen==k));
    end
end
%S
for k=-2:2
    for n=N_sess_S_counterfactual(1):N_sess_S_counterfactual(2)
        DeltaER_S_short_counterfactual(k+3,n-N_sess_S_counterfactual(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)>1 & dataTable.horizon(:)==1 & dataTable.session(:)==n & dataTable.deltaERchosen==k));
        DeltaER_S_long_counterfactual(k+3,n-N_sess_S_counterfactual(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)>1 & dataTable.horizon(:)==-1 & dataTable.session(:)==n  & dataTable.deltaERchosen==k));
    end
end
%E
for k=-2:2
    for n=N_sess_E_counterfactual(1):N_sess_E_counterfactual(2)
        DeltaER_E_short_counterfactual(k+3,n-N_sess_E_counterfactual(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)>1 & dataTable.horizon(:)==1 & dataTable.session(:)==n & dataTable.deltaERchosen==k));
        DeltaER_E_long_counterfactual(k+3,n-N_sess_E_counterfactual(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)>1 & dataTable.horizon(:)==-1 & dataTable.session(:)==n  & dataTable.deltaERchosen==k));
    end
end

%Partial feedback sessions
%M
for k=-2:2
    for n=N_sess_M_partial(1):N_sess_M_partial(2)
        DeltaER_M_short_partial(k+3,n-N_sess_M_partial(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==2 & dataTable.choice_num(:)>1 & dataTable.horizon(:)==1 & dataTable.session(:)==n & dataTable.deltaERchosen==k));
        DeltaER_M_long_partial(k+3,n-N_sess_M_partial(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='M' & dataTable.condition(:)==2 & dataTable.choice_num(:)>1 & dataTable.horizon(:)==-1 & dataTable.session(:)==n  & dataTable.deltaERchosen==k));
    end
end
%S
for k=-2:2
    for n=N_sess_S_partial(1):N_sess_S_partial(2)
        DeltaER_S_short_partial(k+3,n-N_sess_S_partial(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==2 & dataTable.choice_num(:)>1 & dataTable.horizon(:)==1 & dataTable.session(:)==n & dataTable.deltaERchosen==k));
        DeltaER_S_long_partial(k+3,n-N_sess_S_partial(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='S' & dataTable.condition(:)==2 & dataTable.choice_num(:)>1 & dataTable.horizon(:)==-1 & dataTable.session(:)==n  & dataTable.deltaERchosen==k));
    end
end
%E
for k=-2:2
    for n=N_sess_E_partial(1):N_sess_E_partial(2)
        DeltaER_E_short_partial(k+3,n-N_sess_E_partial(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==2 & dataTable.choice_num(:)>1 & dataTable.horizon(:)==1 & dataTable.session(:)==n & dataTable.deltaERchosen==k));
        DeltaER_E_long_partial(k+3,n-N_sess_E_partial(1)+1)=nanmean(dataTable.rightChoice(dataTable.exclude==0 & dataTable.name(:)=='E' & dataTable.condition(:)==2 & dataTable.choice_num(:)>1 & dataTable.horizon(:)==-1 & dataTable.session(:)==n  & dataTable.deltaERchosen==k));
    end
end

DeltaER_all_short_counterfactual=horzcat(DeltaER_M_short_counterfactual,DeltaER_S_short_counterfactual,DeltaER_E_short_counterfactual);
DeltaER_all_short_partial=horzcat(DeltaER_M_short_partial,DeltaER_S_short_partial,DeltaER_E_short_partial);

DeltaER_all_long_counterfactual=horzcat(DeltaER_M_long_counterfactual,DeltaER_S_long_counterfactual,DeltaER_E_long_counterfactual);
DeltaER_all_long_partial=horzcat(DeltaER_M_long_partial,DeltaER_S_long_partial,DeltaER_E_long_partial);

x_der=-2:1:2;
x_der2=(-2+0.15):1:(2+0.15);

DeltaER_all_long=horzcat(DeltaER_all_long_counterfactual,DeltaER_all_long_partial);

figure
errorbar(x_der,nanmean(DeltaER_all_long,2),nanstd(DeltaER_all_long,0,2)./sqrt(sum(~isnan(DeltaER_all_long),2)-1),'-','Color','k','LineWidth',2)
xlim([-3 3])
ylim([0.2 0.9])
box off
title('Figure 3B')
ylabel('P(right option)')
xlabel('Chosen update')

%M
for k=-2:2
    for n=N_sess_M_counterfactual(1):N_sess_M_counterfactual(2)
        DeltaER_M_long_counterfactual_c(k+3,n-N_sess_M_counterfactual(1)+1)=nanmean(dataTable.rightChoice(dataTable.name(:)=='M' & dataTable.condition(:)==1 & dataTable.choice_num(:)>1 & dataTable.horizon(:)==-1 & dataTable.session(:)==n  & dataTable.deltaERcounterfactual==k));
    end

end
%S
for k=-2:2
    for n=N_sess_S_counterfactual(1):N_sess_S_counterfactual(2)
        DeltaER_S_long_counterfactual_c(k+3,n-N_sess_S_counterfactual(1)+1)=nanmean(dataTable.rightChoice(dataTable.name(:)=='S' & dataTable.condition(:)==1 & dataTable.choice_num(:)>1 & dataTable.horizon(:)==-1 & dataTable.session(:)==n  & dataTable.deltaERcounterfactual==k));
    end

end
%E
for k=-2:2
    for n=N_sess_E_counterfactual(1):N_sess_E_counterfactual(2)
        DeltaER_E_long_counterfactual_c(k+3,n-N_sess_E_counterfactual(1)+1)=nanmean(dataTable.rightChoice(dataTable.name(:)=='E' & dataTable.condition(:)==1 & dataTable.choice_num(:)>1 & dataTable.horizon(:)==-1 & dataTable.session(:)==n  & dataTable.deltaERcounterfactual==k));
    end
end

DeltaER_all_long_counterfactual_c=horzcat(DeltaER_M_long_counterfactual_c,DeltaER_S_long_counterfactual_c,DeltaER_E_long_counterfactual_c);

figure
errorbar(x_der,nanmean(DeltaER_all_long_counterfactual_c,2),nanstd(DeltaER_all_long_counterfactual_c,0,2)./sqrt(sum(~isnan(DeltaER_all_long_counterfactual_c),2)-1),'-','Color',color_complete_LH,'LineWidth',2)
xlim([-3 3])
ylim([0.2 0.8])
box off
title('Figure 3C')
ylabel('P(right option)')
xlabel('Unhosen update')


%% Figure 2D

figure

bar(1,mean(Partial.fit1partial.ER+Partial.fit1partial.horizonXER),'Facecolor',color_partial_SH)
hold on
errorbar(1,mean(Partial.fit1partial.ER+Partial.fit1partial.horizonXER),std(Partial.fit1partial.ER+Partial.fit1partial.horizonXER),'k','LineWidth',2)
hold on
bar(2,mean(Partial.fit1partial.ER-Partial.fit1partial.horizonXER),'Facecolor',color_partial_LH)
hold on
errorbar(2,mean(Partial.fit1partial.ER-Partial.fit1partial.horizonXER),std(Partial.fit1partial.ER+Partial.fit1partial.horizonXER),'k','LineWidth',2)
hold on
bar(4,mean(Complete.fit1complete.ER+Complete.fit1complete.horizonXER),'Facecolor',color_complete_SH)
hold on
errorbar(4,mean(Complete.fit1complete.ER+Complete.fit1complete.horizonXER),std(Complete.fit1complete.ER+Complete.fit1complete.horizonXER),'k','LineWidth',2)
hold on
bar(5,mean(Complete.fit1complete.ER-Complete.fit1complete.horizonXER),'Facecolor',color_complete_LH)
hold on
errorbar(5,mean(Complete.fit1complete.ER-Complete.fit1complete.horizonXER),std(Complete.fit1complete.ER-Complete.fit1complete.horizonXER),'k','LineWidth',2)
box off
ylabel('EV regression weight')
xlabel('Choice type')
title('Figure 2D')

%% Figure 3E


figure

subplot(1,4,1)
bar(1,mean(Partial1.fit8firstdatasetpartial.baselineER),'Facecolor',color_partial_LH)
hold on
errorbar(1,mean(Partial1.fit8firstdatasetpartial.baselineER),std(Partial1.fit8firstdatasetpartial.baselineER),'k','LineWidth',2)
hold on
bar(2,mean(Complete1.fit8firstdatasetcomplete1.baselineER),'Facecolor',color_complete_LH)
hold on
errorbar(2,mean(Complete1.fit8firstdatasetcomplete1.baselineER),std(Complete1.fit8firstdatasetcomplete1.baselineER),'k','LineWidth',2)
box off
title('EV at observation')

subplot(1,4,2)
bar(1,mean(Partial1.fit8firstdatasetpartial.RB),'Facecolor',color_partial_LH)
hold on
errorbar(1,mean(Partial1.fit8firstdatasetpartial.RB),std(Partial1.fit8firstdatasetpartial.RB),'k','LineWidth',2)
hold on
bar(2,mean(Complete1.fit8firstdatasetcomplete1.RB),'Facecolor',color_complete_LH)
hold on
errorbar(2,mean(Complete1.fit8firstdatasetcomplete1.RB),std(Complete1.fit8firstdatasetcomplete1.RB),'k','LineWidth',2)
box off
title('Repetition bias')

subplot(1,4,3)
bar(1,mean(Partial1.fit8firstdatasetpartial.deltaERchosen),'Facecolor',color_partial_LH)
hold on
errorbar(1,mean(Partial1.fit8firstdatasetpartial.deltaERchosen),std(Partial1.fit8firstdatasetpartial.deltaERchosen),'k','LineWidth',2)
hold on
bar(2,mean(Complete1.fit8firstdatasetcomplete1.deltaERchosen),'Facecolor',color_complete_LH)
hold on
errorbar(2,mean(Complete1.fit8firstdatasetcomplete1.deltaERchosen),std(Complete1.fit8firstdatasetcomplete1.deltaERchosen),'k','LineWidth',2)
box off
title('Chosen update')

subplot(1,4,4)
bar(1,mean(Complete1.fit8firstdatasetcomplete1.deltaERcounterfactual),'Facecolor',color_complete_LH)
hold on
errorbar(1,mean(Complete1.fit8firstdatasetcomplete1.deltaERcounterfactual),std(Complete1.fit8firstdatasetcomplete1.deltaERcounterfactual),'k','LineWidth',2)
box off
title('Unchosen update')



