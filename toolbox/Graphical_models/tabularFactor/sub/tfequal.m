function eq = tfequal(varargin)
%% Check for tabular factor (approximate) equality

if iscell(varargin{1})
    eq = all(cellfun(@tfequal, varargin{:})); 
    return;
end

TF1 = varargin{1}; 
eq = true; 
for i=2:nargin
   TFi = varargin{i}; 
   eq = eq && approxeq(TF1.T, TFi.T)          && ...
              isequal(TF1.domain, TFi.domain) && ...
              isequal(TF1.sizes, TFi.sizes); 
end
end