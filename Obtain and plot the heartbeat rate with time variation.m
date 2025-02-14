%% loading the filtered and original data
load('ecg_filtered.mat');
load('ecg_data.mat');
load('ecg_segment.mat');
%% Divide the signal into many segments

segment_length = 3*fs; % makint the length of segment is 3 seconds 
num_segments = floor(length(filtered_ecg_signal) / segment_length);
time_intervals = (0:num_segments-1)*3; % time interval vector for each segment
heart_rates = zeros(1, num_segments); % preallocation of heartbeat values

% Calculate heart rate for each segment
for i = 1:num_segments
    segment = filtered_ecg_signal((i-1)*segment_length + (1:segment_length));
    % each segment values
    MPH=max(segment)/2; % minimum peak height for each segment
    [~, r_peaks] = findpeaks(segment, 'MinPeakHeight', MPH, 'MinPeakDistance', fs*0.4);
    RR_intervals = diff(r_peaks) /fs; % time of 2 R-peaks 
    heart_rates(i) = 60 / mean(RR_intervals); % heart rate in BPM
end

% plot heart rate variation with time
figure(1)
plot(time_intervals, heart_rates);
xlabel('Time (Sec)');
ylabel('Heart Rate (BPM)');
title('Heartbeat rate variation over time');
grid on;

%% save heart rates data to be used in task h
save('heart_rate.mat','heart_rates','time_intervals');
