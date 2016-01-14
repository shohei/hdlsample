%% sla_FFT.slx

%% パラメータ設定
N = 1024; %FFT Size
sr =10e3; % Sampling Rate
addrWidth = uint16(log2(N));
addrOffst = fi(N/2, 0, ceil(log2(N/2+1)), 0);
countMax = fi(4095, 0, ceil(log2(4095+1)), 0);
countMax2 = fi(6144, 0, ceil(log2(6144+1)), 0);

inputSignalFreq = [320 810 1290];
simTime = 1/sr*N*10;

%% 

if N == 4096
    fftLatency = 8455;
elseif N == 2048
    fftLatency = 4225;
elseif N == 1024
    fftLatency = 2139;
elseif N == 512
    fftLatency = 1077;
elseif N == 256
    fftLatency = 559;
end