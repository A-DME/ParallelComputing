function  [dim,lb,ub,x0] = celltowersetup(N,up,seed) 

low = 0;
st = RandStream('mcg16807', 'Seed', seed);
R = rand(st, N,1)+1;


xL = low; xU = up;
yL = low; yU = up;

lb = zeros(2*N,1);
ub = lb;
lb(1:2:2*N) = xL + R;
lb(2:2:2*N) = yL + R;
ub(1:2:2*N) = xU - R; 
ub(2:2:2*N) = yU - R;


x0 = up*rand(st, 2*N,1);

dim = struct('R', R, 'xL', xL, 'xU', xU, 'yL', yL, 'yU', yU);