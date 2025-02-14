% first we need to extract the first 10 second from the ECG signal so we
% loaded the data we saved in task_a and the total signal if we needed it 
%% loading the data 
load('ecg_data.mat');
load('ecg_segment.mat');
%% first method to get the average heart rate
% Detect R-peaks
[~, peaks]=findpeaks(ecg_segment, 'MinPeakHeight', 1, 'MinPeakDistance', fs*0.8);
num_peaks=length(peaks);
heartbeats=num_peaks/10; % beats per second
AHR1=heartbeats*60; % in BPM
fprintf('average heart rate for first approach in BPM: %f BPM\n', AHR1);
%% second method to get the average heart rate
time_intervals = diff(peaks) / fs; %time interval between each 2 peaks in seconds
AHR2 = 60 / mean(time_intervals);% Average heart rate in BPM
fprintf('average heart rate for second approach in BPM: %f BPM\n', AHR2);
%% another method relative to the previous one
% as the heart rate is constant for the first 10 second so the time 
% intervals are approxamitely the same you can use only one interval and 
% get approxmate value for the heart rate
time1=(peaks(2)-peaks(1))/fs; %time between first 2 peaks 
AHR3=60/time1; % Average heart rate in BPM
fprintf('approx average heart rate for second approach in BPM: %f BPM\n', AHR3);
