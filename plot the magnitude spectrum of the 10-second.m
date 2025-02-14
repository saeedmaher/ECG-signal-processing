% as in task_b, first we need to extract the first 10 second from the ECG
%so we loaded the data we saved in task_a and the total signal if we needed it 
%% loading the data 
load('ecg_data.mat');
load('ecg_segment.mat');
%% double sided spectrum 
fft_ecg = fft(ecg_segment);
DMS = abs(fft_ecg) / N; % double-sided magnitude spectrum values
DF = (-N/2:N/2-1) * (fs/N); % frequencies vector for double-sided 
DMS = fftshift(DMS); %used to arrange the magnitude of each frequency
figure(1)
plot(DF, DMS);
xlabel('Frequency (Hz)');
ylabel('Spectrum magnitude');
title('Double-sided Spectrum');
%% single sided spectrum
temp_arr = abs(fft_ecg(1:(N/2)+1))/N; %to carry the value of the first half of fft
SMS = [temp_arr(1),2*temp_arr(2:end)]; % single-sided magnitude spectrum values
SF = (0:N/2)*(fs/N); % frequencies vector for single-sided
figure(2)
plot(SF, SMS);
xlabel('Frequency (Hz)');
ylabel('Spectrum magnitude');
title('Single-sided Spectrum');