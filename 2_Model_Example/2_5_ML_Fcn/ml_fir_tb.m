
close all

numSamples = 256*4;  % Number of input vectors
Fs = 44100;      % Sampling frequency in Hz
sinFreq = 1000; % Input sine frequency in Hz

% Create input data
data = 5 * sin( 2 * pi * [1:numSamples] / (Fs/sinFreq));
rand('state',0);
noise = 2*(rand(1,numSamples)-0.5);

indata = data + noise;
outdata = zeros(1, numSamples);

% Apply filter to each input sample
for n = 1:numSamples
  % Call to design
  outdata(n) = ml_fir(indata(n));
end

figure('Name', 'IO_plot');
subplot(2,2,1); plot(data);
axis([1 numSamples -6 6]);
title(['Input = ',num2str(sinFreq),' Hz']);
subplot(2,2,2); plot(noise);
axis([1 numSamples -6 6]);
title('Noise');

% Plot input and output of filter
subplot(2,2,3); plot(indata);
axis([1 numSamples -6 6]);
title('Combined Input');
subplot(2,2,4); plot(outdata);
axis([1 numSamples -6 6]);
title('Filtered Output');

% Plot PSD of input and output
figure('Name', [mfilename, '_psd_plot']);
[Pin, f] = periodogram(indata, hamming(numSamples), numSamples, Fs);
[Pout, f] = periodogram(outdata, hamming(numSamples), numSamples, Fs);
plot(f, 10*log10(Pin), 'r', f, 10*log10(Pout), 'b')
grid on
title('Input and Output PSD');
legend('Input','Output');

             