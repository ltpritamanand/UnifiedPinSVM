function [v,v1,opt_tau,opt_tau1,h]= tune_tau(Ctrain,dtrain,Ctest,dtest,C,kernel,p1)
tauval= -1:0.01:1; 
 lamdba =zeros(length(tauval),size(dtrain,1));
%%
for jj=1:length(tauval)
tau= tauval(jj);
% [pdtest, run_time] = Reward_svm(Ctrain, dtrain, Ctest, dtest, kernel, tau,C);
  [pdtest1,  alpha_beta1,b1] = pin_svm(Ctrain, dtrain, Ctest, kernel, tau,C,p1);
 %[pdtest,  alpha_beta,b] = uni_pin_svm(Ctrain, dtrain, Ctest, kernel, tau,C);
  [pdtest,  alpha_beta,b] = Unified_pin_svm(Ctrain, dtrain, Ctest, kernel, tau,C,p1);
  lambda(jj,:)= alpha_beta; 
  lambda1(jj,:)= alpha_beta1; 
  acc(jj)= length(find(pdtest==dtest))*100/length(dtest);
  acc1(jj)= length(find(pdtest1==dtest))*100/length(dtest);
    %%
    %[trainCorr1, testCorr1, cpu_time1, fold_correctness1]=n_twsvm(data,label,c, kernel, kerpara,  k, output);  
    % [trainCorr2, testCorr2, cpu_time2, fold_correctness2]=mbsvm(data,label,c1, kernel, kerpara,  k, output)
    % x=fold_correctness1;
    % y=fold_correctness2;ll
    % [h,p]=ttest(x,y,0.5)

end
 Ymat=[acc1',acc'];
 h=createfigure_graph(tauval,Ymat);
 plot(tauval,acc,'r-');
 hold on;
 plot(tauval,acc1,'k-'); 
 [v,i1]=max(acc);
 [v1,i2]=max(acc1);
  opt_tau=tauval(i1);
opt_tau1=tauval(i2);
end