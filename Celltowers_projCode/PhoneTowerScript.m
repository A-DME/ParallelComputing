
%% Define parameters

towers = 40;  % number of towers
side = 15;    % dimension of piece of land (one side)
seed = 5;     % seed for random initial condition

%% Define initial conditions
% |celltowersetup.m| sets up the initial conditions:
%
%  dimensions.R  : radius of cell tower coverage
%  dimensions.xL : 0       % for plotting
%  dimensions.xU : side    % for plotting
%  dimensions.yL : 0       % for plotting
%  dimensions.yU : side    % for plotting
%  lb            : lower bound values for x, y (based on the radius)
%  ub            : upper bound values for x, y (based on the radius)
%  x0            : initial center points (x, y pairs)

[dimensions,lb,ub,x0] = helper.celltowersetup(towers,side,seed);
%% Run without MATLABPOOL i.e.without using parallel computing
tic
[x,fval,exitflag,output] = helper.myOptim(x0,lb,ub,dimensions);
toc

%% Run with MATLABPOOL
% Open 1 worker. Re-run the optimization routine to see the speedup.

matlabpool open 1

tic
[x,fval,exitflag,output] = helper.myOptim(x0,lb,ub,dimensions);
toc

%% Close MATLABPOOL

matlabpool close
%% Run with MATLABPOOL
% Open 2 workers. Re-run the optimization routine to see the speedup.

matlabpool open 2

tic
[x,fval,exitflag,output] = helper.myOptim(x0,lb,ub,dimensions);
toc

%% Close MATLABPOOL

matlabpool close
%% Run with MATLABPOOL
% Open 3 workers. Re-run the optimization routine to see the speedup.

matlabpool open 3

tic
[x,fval,exitflag,output] = helper.myOptim(x0,lb,ub,dimensions);
toc

%% Close MATLABPOOL

matlabpool close

%% Run with MATLABPOOL
% Open 4 workers. Re-run the optimization routine to see the speedup.

matlabpool open 4

tic
[x,fval,exitflag,output] = helper.myOptim(x0,lb,ub,dimensions);
toc
helper.plotOptimSummary(output,dimensions);

%% Close MATLABPOOL

matlabpool close