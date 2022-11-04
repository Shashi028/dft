clear all
close all
clc
dt = 0.001 ;
t = 0:dt:1;
fclean =sin(2*pi*50*t) + sin(2*pi*120*t);
f=fclean + 2.5*randn(size(t));
figure;
subplot(2,2,1);
plot(t, f, 'c'), hold on
plot(t, fclean, 'k')
xlabel('Time')
ylabel('Amplitude')
title('Pure(clean) signal and noisy signal')
n = length(t);
fhat = fft(f, n);
PSD = fhat.*conj (fhat)/n;
freq = 1/(dt*n) * (0:n);
L = 1: floor(n/2);
subplot(2,2,2);
plot(freq (L), PSD (L)), hold on
xlabel('Freq in Hertz')
ylabel('Power')
title('Power spectral Density(PSD) of Noisy signal')
indices = PSD>100;
fhat= indices.*fhat;
PSDclean = PSD.*indices;
ffilt= ifft(fhat);
subplot(2,2,3);
plot (freq (L), PSDclean (L))
xlabel('Freq in Hertz')
ylabel('Power')
title('PSD of noisy signal after setting threshold')
subplot(2,2,4);
plot (t, ffilt)
xlabel('Time')
ylabel('Amplitude')
title('Pure(clean) signal recovered after IFFT')