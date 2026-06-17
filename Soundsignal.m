% Read the audio file
[audioSignal, Fs] = audioread('The Pink Panther Intro.wav'); % Fs is the sampling frequency

% If stereo, convert to mono by averaging channels
if size(audioSignal, 2) == 2
    audioSignal = mean(audioSignal, 2);
end

% Convert to double for precision
audioSignal = double(audioSignal);

% Calculate statistical features
meanValue = mean(audioSignal);
stdValue = std(audioSignal);
skewnessValue = skewness(audioSignal);
kurtosisValue = kurtosis(audioSignal);
medianValue = median(audioSignal);
varianceValue = var(audioSignal);
rangeValue = range(audioSignal);
modeValue = mode(audioSignal);
entropyValue = entropy(audioSignal); % Can use entropy on the normalized signal

% Percentiles
percentile25 = prctile(audioSignal, 25);
percentile50 = prctile(audioSignal, 50);  % Median is also the 50th percentile
percentile75 = prctile(audioSignal, 75);

% Display the calculated features in the Command Window
fprintf('Mean: %f\n', meanValue);
fprintf('Standard Deviation: %f\n', stdValue);
fprintf('Skewness: %f\n', skewnessValue);
fprintf('Kurtosis: %f\n', kurtosisValue);
fprintf('Median: %f\n', medianValue);
fprintf('Variance: %f\n', varianceValue);
fprintf('Range: %f\n', rangeValue);
fprintf('Mode: %f\n', modeValue);
fprintf('Entropy: %f\n', entropyValue);
fprintf('25th Percentile: %f\n', percentile25);
fprintf('50th Percentile: %f\n', percentile50);
fprintf('75th Percentile: %f\n', percentile75);

% Create visual representation
figure;

% Plot the waveform of the audio signal
subplot(3, 4, 1);
plot(audioSignal);
title('Audio Signal Waveform');
xlabel('Sample Number');
ylabel('Amplitude');

% Plot histogram of the audio signal amplitude
subplot(3, 4, 2);
histogram(audioSignal, 256);
title('Histogram of Amplitude Values');
xlabel('Amplitude');
ylabel('Frequency');

% Plot mean
subplot(3, 4, 3);
bar(1, meanValue);
title('Mean');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot standard deviation
subplot(3, 4, 4);
bar(1, stdValue);
title('Standard Deviation');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot skewness
subplot(3, 4, 5);
bar(1, skewnessValue);
title('Skewness');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot kurtosis
subplot(3, 4, 6);
bar(1, kurtosisValue);
title('Kurtosis');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot median
subplot(3, 4, 7);
bar(1, medianValue);
title('Median');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot variance
subplot(3, 4, 8);
bar(1, varianceValue);
title('Variance');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot range
subplot(3, 4, 9);
bar(1, rangeValue);
title('Range');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot mode
subplot(3, 4, 10);
bar(1, modeValue);
title('Mode');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot entropy
subplot(3, 4, 11);
bar(1, entropyValue);
title('Entropy');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot percentiles (25th, 50th, 75th)
subplot(3, 4, 12);
bar([percentile25, percentile50, percentile75]);
title('Percentiles (25th, 50th, 75th)');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue, percentile75])]);
xticklabels({'25th', '50th', '75th'});

% Adjust layout for better visualization
sgtitle('Statistical Features of Sound Signal');
