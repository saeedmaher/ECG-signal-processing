
%% loading of the filtered and original data
load('ecg_filtered.mat');

%% implementation of STFT using spectrogram
window_size = 3 * fs; % window size is capturing 3 periods
overlap = round(window_size * 0.5); % overlap is 50%
[S, F, T] = spectrogram(filtered_ecg_signal, hamming(window_size), overlap, [], fs);
% getting the spectrogram of the filtered signal
X = abs(S); % as S is complex we got the magnitude
% focus on the frequency range for heart rate (typically 1~7/3 Hz):(60~140)BPM
low_freq = 0.5; % Lower bound of heart rate frequency range (Hz)
high_freq = 2.333;  % Upper bound of heart rate frequency range (Hz)
F_IN = find(F >= low_freq & F <= high_freq); % the indices for the heart rate frequency range
mag_spectrum_ST = X(F_IN,:); % extract the magnitude spectrum in the heart rate frequency range
[~, max_indices] = max(mag_spectrum_ST, [], 1); % determine the position of max contribution frequency
dominant_frequencies = F(F_IN(max_indices)); % get the dominant frequency
heart_rate_stft = dominant_frequencies * 60; % convert to BPM
% Plot heart rate variation using STFT
figure(1);
plot(T, heart_rate_stft);
xlabel('Time (sec)');
ylabel('Heart rate (BPM)');
title('Heart rate variation using STFT (hamming window)');
grid on;