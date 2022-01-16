function [x,fval,exitflag,output,lambda,grad,hessian] = myOptim(x0,lb,ub,dimensions)

options = optimset;

options = optimset(options,'Display' ,'iter');
options = optimset(options,'TolFun' ,0.001);
options = optimset(options,'OutputFcn' ,{ @helper.myOutputFcn });
options = optimset(options,'PlotFcns' ,{  @optimplotfval @(x,itervals,flag) helper.plotFcn(x,itervals,flag,dimensions) });
options = optimset(options,'LargeScale' ,'off');
options = optimset(options,'UseParallel','always');
options = optimset(options, 'Algorithm', 'active-set');
[x,fval,exitflag,output,lambda,grad,hessian] = ...
  fmincon(@(x) helper.objFcn(x,dimensions.R),x0,[],[],[],[],lb,ub,[],options);
