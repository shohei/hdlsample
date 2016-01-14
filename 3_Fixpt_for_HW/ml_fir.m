function outdatabuf=ml_fir(indatabuf)
% MATLAB design: FIR Filter
assert(isa(indatabuf, 'double'))

% Load the filter coefficients
coeff = fir1(15, 0.2);	% Not being generated as a function

persistent tap_delay;

% Clear tap delay line at beginning
if isempty(tap_delay)
  tap_delay = zeros(1,length(coeff));
end

% Perform sum of products
outdatabuf = tap_delay * coeff(end:-1:1)';

% Shift tap delay line
tap_delay = [tap_delay(2:length(coeff)) indatabuf];
