% set initial parameters
TAPmax = 11;
TAP = 5; %Initial TAPs
Sigma = 0.5;
LineSize = 160;

% Set Fixed Point Digits
L = 10;
dt_imagein = fixdt(1,L,L-2);
dt_Hvector = fixdt(0,L+2,L+2);
dt_product = fixdt(1,2*L,2*L-2);
dt_presum = fixdt(1,L+4,L-1);
dt_sum = fixdt(1,L,L-2);

% set delay length
for ii = 1:TAPmax-1
  LineBuf(ii) = LineSize*( ii < TAP );
  TAPDly(ii) = (TAP-1)*( ii < TAP)+1;
end

H = fspecial('gau',[TAP TAP],Sigma);
freqz2(H);
Hvector = reshape(H, TAP*TAP, 1);

Hvector_fi = fi(Hvector, 0, L+2, L+2);
Hsame{1} = find(Hvector_fi == Hvector_fi(1))
Hsame{2} = find(Hvector_fi == Hvector_fi(3))
Hsame{3} = find(Hvector_fi == Hvector_fi(7))
Hsame{4} = find(Hvector_fi == Hvector_fi(8))
Hsame{5} = 13



