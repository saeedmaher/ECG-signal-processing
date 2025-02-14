%% loading the data 
load('ecg_data.mat');
load('ecg_segment.mat');
%% filtering process for ECG segment

filtered_ecg_segment = filter(Bp_filter,ecg_segment); % filtering the segment
% for time domain domain
time=time_each_sample(1:N);
%ploting the filtered signal in time domain
figure(1)
plot(time,filtered_ecg_segment);
xlabel('Time (Sec)');
ylabel('ECG');
title('ECG segment after filteration');

% for frequency domain
fft_FES= abs(fft(filtered_ecg_segment))/N; % FFT for the filtered segment
filterd_FD=fftshift(fft_FES); % rearranging the FFT
frequencies=(-N/2:N/2-1)*(fs/N);
%ploting the filtered signal in frequency domain
figure(2)
plot(frequencies,filterd_FD);
xlabel('Frequency (Hz)');
ylabel('Spectrum magnitude');
title('Double-sided spectrum after filteration');

%% filtering process for whole ECG signal
TN=length(ecg_signal); % total number of samples
filtered_ecg_signal = filter(Bp_filter,ecg_signal); % filtering the signal
% for time domain domain
%ploting the filtered signal in time domain
figure(3)
plot(time_each_sample,filtered_ecg_signal);
xlabel('Time (Sec)');
ylabel('ECG');
title('ECG signal after filteration');

% for frequency domain
fft_FESignal= abs(fft(filtered_ecg_signal))/N; % FFT for the filtered signal
filterd_FD_signal=fftshift(fft_FESignal); % rearranging the FFT
frequencies=(-TN/2:TN/2-1)*(fs/TN);
%ploting the filtered signal in frequency domain
figure(4)
plot(frequencies,filterd_FD_signal);
xlabel('Frequency (Hz)');
ylabel('Spectrum magnitude');
title('Double-sided spectrum after filteration');
 
%% Saving data can be used in other codes
save('ecg_filtered.mat','filtered_ecg_segment','filtered_ecg_signal','TN'); 
