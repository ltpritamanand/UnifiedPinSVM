function [pred_label, alpha_beta,b] = Unified_pin_svm(X_train, Y_train, X_test, kernel, tau, C,p1)
m = size(X_train,1);
H = zeros(m,m);
m1=size(X_test,1);

%% Kernel Construction
if(kernel==1)
    for i=1:m
        for j=1:m
            H(i,j) = Y_train(i)*Y_train(j)*svkernel('linear',X_train(i,:), X_train(j,:),p1);
        end
    end
end

if(kernel==2)
    for i=1:m
        for j=1:m
            H(i,j) = Y_train(i)*Y_train(j)*svkernel('rbf',X_train(i,:), X_train(j,:),p1);
        end
    end
end

if(tau==0)
    H4 = H;
    f = -ones(m,1);
    Aeq = Y_train';
    beq= [0];
    LB = zeros(m,1);
    UB= C;
    options.Display = 'off';
   options.MaxIter = 500;
   alpha_beta = quadprog(H4, f, [], [], Aeq, beq, LB, UB, [],options);
   idx = find( (alpha_beta  > 1e-9) & ( alpha_beta  < (C-1e-19) ));
   if isempty(idx)
      b=0;
   else
    b=mean(Y_train(idx,1)-(H(idx,:)*(alpha_beta.*Y_train)));
    end
else 
   
   
% Add small amount of zero order regularisation to avoid problems
% when Hessian is badly conditioned.
% H = H+1e-10*eye(size(H));

%% Solving QPP given in eq 7
    H4 = [H, -sign(tau)*H; -sign(tau)*H, H];
    f = -[ones(m,1); -sign(tau)*ones(m,1)];
    Aeq = [Y_train', -sign(tau)*Y_train'; eye(m,m), sign(tau)*(1/tau)*eye(m,m)];
    beq= [0; C];
    LB = zeros(2*m,1);
 %%   
% options = optimset('Algorithm', 'Trust-region-reflective');
options.Display = 'off';
options.MaxIter = 500;
lambda_beta = quadprog(H4, f, [], [], Aeq, beq, LB, [], [],options);
alpha=lambda_beta(1:m,:);
beta=lambda_beta(m+1:end,:);
alpha_beta=alpha-sign(tau)*beta;

%% For calculation of bias term (from eq 1 on page 4)
idx = find( (abs(alpha )> 1e-9) & (abs(beta) > 1e-9));
if isempty(idx)
    b=0;
else
    b=mean(Y_train(idx,1)-(H(idx,:)*(alpha_beta.*Y_train)));
end

%% 
end
H_test = zeros(m1, m);
if(kernel==1)
    for i=1:m1
        for j=1:m
            H_test(i,j) = svkernel('linear',X_test(i,:), X_train(j,:),p1);
        end
    end
end

if(kernel==2)
    for i=1:m1
        for j=1:m
            H_test(i,j) = svkernel('rbf',X_test(i,:), X_train(j,:),p1);
        end
    end
end
%%
pred_label = sign(H_test*(alpha_beta.* Y_train) +b);
% spars = length((alpha_beta.* Y_train))- nnz(alpha_beta.* Y_train);
end
