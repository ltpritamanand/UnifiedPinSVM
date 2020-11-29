tic
close all;
clear all;
clc
%% 
 d= {'Dataset', 'Accuracy','Time','p','C','tau'};  
 xlswrite('nonlin_res_pin.xlsx', d,'F1');

for index=2:20
%%
if(index==2)
load('monks_2_train.txt');
load('monks_2_test.txt');
 Ctrain= monks_2_train(:,2:end);
 dtrain=  monks_2_train(:,1);
 dtrain(find(dtrain==0))=-1;
 Ctest= monks_2_test(:,2:end);
 dtest=  monks_2_test(:,1);
 dtest(find(dtest==0))=-1;
  disp('Monk 2');
end
 %%
 if (index==3)
 load('monks_3_train.txt');
 load('monks_3_test.txt');
 Ctrain= monks_3_train(:,2:end);
 dtrain=  monks_3_train(:,1);
 dtrain(find(dtrain==0))=-1;
 Ctest= monks_3_test(:,2:end);
 dtest=  monks_3_test(:,1);
 dtest(find(dtest==0))=-1;
   disp('Monk 3');
 end
 %%
  if (index==4)
load('SPECT_train.txt')
 load('SPECT_test.txt');
 Ctrain = SPECT_train(:,2:end);
 dtrain=  SPECT_train(:,1);
 dtrain(find(dtrain==0))=-1;
 Ctest= SPECT_test(:,2:end);
 dtest=  SPECT_test(:,1);
 dtest(find(dtest==0))=-1;
   disp('Spect');
  end
%%
  if (index==5)

 load('Haberman_dataset.mat')
 X=Haberman_data(:,1:end-1);
 Y= Haberman_data(:,end);
 Y(find(Y==2))=-1;
 Ctrain=X(1:150,:);
 dtrain= Y(1:150,:);
 Ctest= X(151:end,:);
 dtest= Y(151:end,:);
 disp ('Heberman');
  end

%%
  if (index==6)
load('heartdata.mat');
 X=heartdata(:,1:end-1);
 Y= heartdata(:,end);
 Y(find(Y==2))=-1;
 Ctrain=X(1:150,:);
 dtrain= Y(1:150,:);
 Ctest= X(151:end,:);
 dtest= Y(151:end,:);
  disp ('Statlog');
  end
 %%
   if (index==7)
  load('ionosphere_data.mat');
  X=data(:,2:end);
  Y= data(:,1);
  Y(find(Y==0))=-1;
  Ctrain=X(1:200,:);
  dtrain= Y(1:200,:);
  Ctest= X(201:end,:);
  dtest= Y(201:end,:);
  disp('Ionosphere')
   end
%%
if (index==8)
   data= xlsread('Pima-Indian.xlsx');
    X=data(:,2:end);
   Y= data(:,1);
   Y(find(Y==0))=-1;
  Ctrain=X(1:300,:);
   dtrain= Y(1:300,:);
  Ctest= X(301:end,:);
   dtest= Y(301:end,:);
   disp('Pima-Indian');
end
%%

if (index==9)
 load('wdbc_data.mat')
 load('wdbc_label.mat')
    X=wdbc_data;
   Y= wdbc_label;
   Y(find(Y==2))=-1;
   Ctrain=X(1:400,:);
   dtrain= Y(1:400,:);
   Ctest= X(401:end,:);
   dtest= Y(401:end,:);
      disp('WDBC');
end
%%
if (index==10)
 load('echocardiogram_data.mat');
 load('echocardiogram_label.mat');
     X=x;
    Y= y;
    Y(find(Y==0))=-1;
    Ctrain=X(1:80,:);
    dtrain= Y(1:80,:);
    Ctest= X(81:end,:);
    dtest= Y(81:end,:);
      disp('Echo');
end

%%
if (index==11)

  load('german.txt');
   X=german(:,1:end-1);
   Y= german(:,end);
   Y(find(Y==2))=-1;
   Ctrain=X(1:500,:);
   dtrain= Y(1:500,:);
   Ctest= X(501:end,:);
   dtest= Y(501:end,:);
         disp('Germans');

   end
%%

if (index==12)

 data=xlsread('Australian.xlsx');
 X=data(:,2:end);
 Y= data(:,1);
 Y(find(Y==2))=-1;
 Ctrain=X(1:400,:);
 dtrain= Y(1:400,:);
 Ctest= X(401:end,:);
 dtest= Y(401:end,:);
       disp('Australian');

end
%%
if (index==13)

  data=xlsread('Bupa-Liver.xlsx');
   X=data(:,2:end);
   Y= data(:,1);
   Y(find(Y==0))=-1;
   Ctrain=X(1:250,:);
   dtrain= Y(1:250,:);
   Ctest= X(251:end,:);
   dtest= Y(251:end,:);
         disp('Bupa');

end

%%
if (index==14)
 load('votes.mat')
  X=votes(:,2:end);
    Y= votes(:,1);  
   Y(find(Y==2))=-1;
   Ctrain=X(1:200,:);
    dtrain= Y(1:200,:);
    Ctest= X(201:end,:);
    dtest= Y(201:end,:);
          disp('Votes');

end
%%
if (index==15)
  load('diabetes_data.mat')
  load('diabetes_label.mat')
 X= data1;
  Y= label;
     Y(find(Y==0))=-1;
   Ctrain=X(1:500,:);
    dtrain= Y(1:500,:);
     Ctest= X(501:end,:);
     dtest= Y(501:end,:);
           disp('Daibetes');

end

%%
if(index==16)
 data=xlsread('fertility_Diagnosis.xlsx');
  X= data(:,1:end-1);
  Y= data(:,end);
     Y(find(Y==0))=-1;
    Ctrain=X(1:50,:);
     dtrain= Y(1:50,:);
     Ctest= X(51:end,:);
     dtest= Y(51:end,:);
           disp('Fertility');

end
%%
if(index==17)
 data= xlsread('Sonar.xlsx');
 rng(2);
  X= data(:,2:end);
  Y= data(:,1);
  Y(find(Y==0))=-1;
  r1=randperm(size(X,1));
  X = X(r1,:);
  Y=Y(r1,:);
  Ctrain=X(1:100,:);
  dtrain= Y(1:100,:);
  Ctest= X(101:end,:);
  dtest= Y(101:end,:);
        disp('Sonar');

end
  
  %%
% %  rng(9);
%  r1=randperm(size(Ctrain,1));
%  Ctrain= Ctrain(r1,:);
%  dtrain=dtrain(r1,:);
%%
if(index==18)
 load('ecoli_data.mat');
 rng(2);
  X= ecoli_data(:,1:end-1);
  Y= ecoli_data(:,end);
  Y(find(Y~=1))=-1;
  r1=randperm(size(X,1));
  X = X(r1,:);
  Y=Y(r1,:);0
  Ctrain=X(1:200,:);
  dtrain= Y(1:200,:);
 Ctest= X(201:end,:);
  dtest= Y(201:end,:);
        disp('Ecoil');

end
%%
if(index==19)
 load('plrx.txt');
  X=plrx(:,1:end-1);
    Y= plrx(:,end);
   Y(find(Y==2))=-1;
    Ctrain=X(1:100,:);
    dtrain= Y(1:100,:);
    Ctest= X(101:end,:);
    dtest= Y(101:end,:);
          disp('Prlx');

end

%%

if(index==20)
 load('spambase.data');
  X=spambase(:,1:end-1);
    Y= spambase(:,end);
   Y(find(Y==0))=-1;
   rng(1);
   r=randperm(length(Y));
   X= X(r,:);
   Y=Y(r,:);
    Ctrain=X(1:3000,:);
    dtrain= Y(1:3000,:);
    Ctest= X(3001:end,:);
    dtest= Y(3001:end,:);
          disp('Spambase');

end

if (index==21)
load('monks_1_train.txt');
 load('monks_1_test.txt');
 Ctrain= monks_1_train(:,2:end);
 dtrain=  monks_1_train(:,1);
 dtrain(find(dtrain==0))=-1;
 Ctest= monks_1_test(:,2:end);
 dtest=  monks_1_test(:,1);
 dtest(find(dtest==0))=-1;
 disp('Monk 1');
end


%% Parameter setting
   Ctrain= svdatanorm(Ctrain,'svpline');
   Ctest= svdatanorm(Ctest,'scpline');
   clear C;
kernel=1;
C0= 2^0;
tau=0;
svm_tau=0;
p1val=[2^-7,2^-6,2^-5,2^-4,2^-3,2^-2,2^-1,2^0,2^1,2^2,2^3,2^4,2^5,2^6,2^7];
c1val=[2^-7,2^-6,2^-5,2^-4,2^-3,2^-2,2^-1,2^0,2^1,2^2,2^3,2^4,2^5,2^6,2^7];
%% Prameter Tunning
  [acc_svm, opt_p1,opt_c1,t1]= tune_para_svm(Ctrain,dtrain,Ctest,dtest,kernel,c1val,p1val);
  p1= opt_p1;
  C0= opt_c1;
  if (kernel==2)
  fprintf('\n Optimal Accuracy = %3.2f with kernel parameter p1= %3.4f and C= %3.4f',acc_svm, opt_p1,opt_c1); 
  end
  if (kernel==1)
  fprintf('\n Optimal Accuracy = %3.2f with  C= %3.4f',acc_svm,opt_c1); 
  end
  fprintf('\n Time Elpased  in Tunning Paramter = %3.2f seconds',t1);
%%
for i=1:size(dtrain,1)
if (dtrain(i)==1)
    C(i,:)= C0;    
else 
    C(i,:)= C0*(length(find(dtrain==-1)))/(length(find(dtrain==1)));  
end
end

%% 
  [acc,acc1,opt_tau,opt_tau1,h]= tune_tau(Ctrain,dtrain,Ctest,dtest,C,kernel,p1);
 %%

%    [pdtest, run_time] = Reward_svm(Ctrain, dtrain, Ctest, dtest, kernel, tau,C);
%    [pdtest,  alpha_beta,b] = pin_svm(Ctrain, dtrain, Ctest, kernel, opt_tau1,C,p1);
      time=0;
       tic
      [pdtest,  alpha_beta,b] = Unified_pin_svm(Ctrain, dtrain, Ctest, kernel, opt_tau,C,p1);
      time=time+toc; 
      acc= length(find(pdtest==dtest))*100/length(dtest);    
     fprintf('\n Unified Pin-SVM Accuracy=%3.2f, time= %3.2f,tau = %3.2f',mean(acc),time,opt_tau);
      d1= [index, acc,time,p1,C0,opt_tau];  

     %%
     
     time=0;
     tic
     [pdtest,  alpha_beta,b] = pin_svm(Ctrain, dtrain, Ctest, kernel, opt_tau1,C,p1);  
     time=time+toc; 
     acc= length(find(pdtest==dtest))*100/length(dtest);    
    fprintf('\n Pin-SVM Accuracy=%3.2f,time= %3.2f,tau = %3.2f',mean(acc),time,opt_tau1);
    d2= [index, acc,time,p1,C0,opt_tau1];  
    

   %%
     time=0;
     tic
      [pdtest,  alpha_beta,b] = Unified_pin_svm(Ctrain, dtrain, Ctest, kernel, svm_tau,C,p1);
     time=time+toc; 
     acc= length(find(pdtest==dtest))*100/length(dtest);    
    fprintf('\n SVM Accuracy=%3.2f,time= %3.2f,tau = 0 \n',mean(acc),time);
    d3= [index, acc,time,p1,C0,svm_tau];  
%%
  dd2(index,:)= [d1,d2,d3];
  
 saveas(gcf,sprintf('Dataset%d.fig',index))
end
[m,n] = size(dd2);
A1=[];
A2=[];
A3=[];

A1= dd2(:,1:6);
A2= dd2(:,7:12);
A3= dd2(:,13:18);

final = zeros( m*3,6);
j=1;
for i=1:m
    final(j,:) = A1(i,:);
    final(j+1,:) = A2(i,:);
    final(j+2,:) = A3(i,:);
    j=j+3;
end

   xlswrite('nonlin_res_pin.xlsx', final);
