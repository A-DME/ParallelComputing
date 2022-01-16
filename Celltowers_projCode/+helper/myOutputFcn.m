function stop = myOutputFcn(x, optimValues, state)

stop = false;

switch state
  case 'init'
    setappdata(0, 'optim_xSaved', []);
    
  case 'iter'
    setappdata(0, 'optim_xSaved', [getappdata(0, 'optim_xSaved'), x]);
        
end