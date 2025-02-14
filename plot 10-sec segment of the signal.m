load('ecg_data.mat');
time_each_sample=(0:1:length(ecg_signal)-1)/fs; % time vector for the whole signal 
N=10*fs; %number of samples in first 10 seconds 
ecg_segment=ecg_signal(1:1:N); % the used data in first 10 seconds
time=time_each_sample(1:1:N); % % time vector for the first 10 seconds of the signal
figure (1)
plot(time,ecg_segment)
xlabel('Time (seconds)');
ylabel('ECG');
title('ECG segment');
save('ecg_segment.mat','ecg_segment','N','time_each_sample'); 
% save the first 10 seconds segment to be reused in other tasks
