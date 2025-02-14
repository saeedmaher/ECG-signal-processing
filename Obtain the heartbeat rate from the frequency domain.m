%% loading the filtered and original data
load('ecg_filtered.mat');
load('ecg_data.mat');
load('ecg_segment.mat');
%% measure the heartbeat 
magnitude_spectrum = abs(fft(ecg_segment));% perform FFT on the ECG signal
frequencies_single = (0:floor(N/2))*(fs/N); % frequency vector (single-sided spectrum)

low_freq = 0.5; % lower bound of heart rate frequency range (Hz)
high_freq = 3.3333;  % upper bound of heart rate frequency range (Hz)
 
freq_indices = find(frequencies_single >= low_freq & frequencies_single <= high_freq);
% find the indices for the heart rate frequency range
mag_spectrum_hr =magnitude_spectrum(freq_indices);% extract the magnitude spectrum corrospom=nding to frequency range
[~, max_idx] = max(mag_spectrum_hr); % location of dominant frequency
dominant_frequency = frequencies_single(freq_indices(max_idx)); % getting value of dominant frequency 
heart_rate_BPM = dominant_frequency * 60; % Convert Hz to BPM
fprintf('Heart rate from the frequency domain: %.2f BPM\n', heart_rate_BPM);