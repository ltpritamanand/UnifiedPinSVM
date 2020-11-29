function [v,opt_p1,opt_c1,t1]= tune_para_svm(Ctrain,dtrain,Ctest,dtest,kernel,c1val,p1val) %%
disp('Tunning parameters....');  
t1=0;
tic
tau=0;
 if (kernel==1)
     p1val= [1];
  end
for ii=1:length(p1val)
    p1=p1val(ii);
    for jj=1:length(c1val)
        C0= c1val(jj);
        


for i=1:size(dtrain,1)
if (dtrain(i)==1)
    C(i,:)= C0;    
else 
    C(i,:)= C0*(length(find(dtrain==-1)))/(length(find(dtrain==1)));  
end
end
%%
     [pdtest,  alpha_beta,b] = Unified_pin_svm(Ctrain, dtrain, Ctest, kernel, tau,C,p1);
     acc(ii,jj)= length(find(pdtest==dtest))*100/length(dtest);
    end    
end

if (kernel==1)
  [v,i]=  max(acc);
  opt_p1= 1;
opt_c1= c1val(i);
t1= t1+toc;
else

[v,i]=max(max(acc));
[v,j]=max(acc(:,i));
opt_p1= p1val(j);
opt_c1= c1val(i);
t1= t1+toc;
end
end
