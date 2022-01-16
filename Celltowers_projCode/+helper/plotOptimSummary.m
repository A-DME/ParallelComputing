function plotOptimSummary(out,dimensions)

xsaved = getappdata(0, 'optim_xSaved');

n = size(xsaved, 1);

if out.iterations > 6
  iters = round(linspace(1, out.iterations, 6));
else
  iters = 1:out.iterations;
end
if ~isempty(iters)
  h2 = findobj('type', 'figure', 'tag', 'optimHighlight');
  close(h2);
  h2 = figure('numbertitle', 'off', 'toolbar', 'none', 'menu', 'none', ...
    'tag', 'optimHighlight', 'color', 'white');
  set(h2,'name','Highlights of Celltower Optimization')
  
  for i = 1:length(iters)
    subplot(2,3,i);
    helper.plotFcn(xsaved(1:n,iters(i)),iters(i),'iter',dimensions);
    axis off;
  end
end

rmappdata(0, 'optim_xSaved');