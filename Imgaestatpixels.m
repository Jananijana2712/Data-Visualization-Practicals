% Read the input image
image = imread('gojo.jpg');

% Convert the image to grayscale if it's not already
if size(image, 3) == 3
    grayImage = rgb2gray(image);
else
    grayImage = image;
end

% Convert the grayscale image to double for precision
grayImage = double(grayImage);

% Calculate statistical features
meanValue = mean(grayImage(:));
stdValue = std(grayImage(:));
skewnessValue = skewness(grayImage(:));
kurtosisValue = kurtosis(grayImage(:));
medianValue = median(grayImage(:));
varianceValue = var(grayImage(:));
rangeValue = range(grayImage(:));
modeValue = mode(grayImage(:));
entropyValue = entropy(uint8(grayImage)); % entropy expects a uint8 input

% Percentiles
percentile25 = prctile(grayImage(:), 25);
percentile50 = prctile(grayImage(:), 50);  % Median is also the 50th percentile
percentile75 = prctile(grayImage(:), 75);

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

% Plot histogram of pixel intensities
subplot(3, 4, 1);
histogram(grayImage(:), 256);
title('Histogram of Pixel Intensities');
xlabel('Pixel Intensity');
ylabel('Frequency');

% Plot mean
subplot(3, 4, 2);
bar(1, meanValue);
title('Mean');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot standard deviation
subplot(3, 4, 3);
bar(1, stdValue);
title('Standard Deviation');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot skewness
subplot(3, 4, 4);
bar(1, skewnessValue);
title('Skewness');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot kurtosis
subplot(3, 4, 5);
bar(1, kurtosisValue);
title('Kurtosis');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot median
subplot(3, 4, 6);
bar(1, medianValue);
title('Median');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot variance
subplot(3, 4, 7);
bar(1, varianceValue);
title('Variance');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot range
subplot(3, 4, 8);
bar(1, rangeValue);
title('Range');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot mode
subplot(3, 4, 9);
bar(1, modeValue);
title('Mode');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot entropy
subplot(3, 4, 10);
bar(1, entropyValue);
title('Entropy');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue])]);

% Plot percentiles (25th, 50th, 75th)
subplot(3, 4, 11);
bar([percentile25, percentile50, percentile75]);
title('Percentiles (25th, 50th, 75th)');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue, rangeValue, modeValue, entropyValue, percentile75])]);
xticklabels({'25th', '50th', '75th'});

% Adjust layout for better visualization
sgtitle('Statistical Features of Image Pixel Intensities');
