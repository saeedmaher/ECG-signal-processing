%% loading the heart rate with time data from task f
load('heart_rate.mat')

%% determin time & heart rate above 100 BPM
above_100 = heart_rates > 100; % get the logical indcies for the abnormality
time_above=time_intervals(above_100); % set the time interval for above the 100 BPM
HR_above=heart_rates(above_100); % set the values of heart rate above 100 BPM
fprintf('the heart rate is above the normal from %isec to %isec\n',time_above(1),time_above(end));
fprintf('the duration time is %i seconds\n',time_above(end)-time_above(1));

%% determin time & heart rate below 60 BPM
below_60 = heart_rates < 60; % get the logical indcies for for below the 60 BPM
time_below=time_intervals(below_60); % set the time interval of the abnormality
HR_below=heart_rates(below_60); % set the values of heart rate below 60 BPM
fprintf('the heart rate is below the normal from %isec to %isec\n',time_below(1),time_below(end));
fprintf('the duration time is %i seconds\n',time_below(end)-time_below(1));

%% plot the graph
figure(1)
plot(time_intervals, heart_rates,'b',time_below,HR_below,'g-o',time_above,HR_above,'r-o');
% add labels and title to the graph
title('Heart rate variation over time (highliting the abnormality)');
xlabel('Time (seconds)');
ylabel('Heart rate (BPM)');
legend('Noramal heart rate', 'Above 100 BPM', 'Below 60 BPM');
grid on;
