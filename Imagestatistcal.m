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

% Display the calculated features in the Command Window
fprintf('Mean: %f\n', meanValue);
fprintf('Standard Deviation: %f\n', stdValue);
fprintf('Skewness: %f\n', skewnessValue);
fprintf('Kurtosis: %f\n', kurtosisValue);
fprintf('Median: %f\n', medianValue);
fprintf('Variance: %f\n', varianceValue);

% Create visual representation
figure;

% Plot histogram of pixel intensities
subplot(2, 3, 1);
histogram(grayImage(:), 256);
title('Histogram of Pixel Intensities');
xlabel('Pixel Intensity');
ylabel('Frequency');

% Plot mean
subplot(2, 3, 2);
bar(1, meanValue);
title('Mean');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue])]);

% Plot standard deviation
subplot(2, 3, 3);
bar(1, stdValue);
title('Standard Deviation');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue])]);

% Plot skewness
subplot(2, 3, 4);
bar(1, skewnessValue);
title('Skewness');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue])]);

% Plot kurtosis
subplot(2, 3, 5);
bar(1, kurtosisValue);
title('Kurtosis');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue])]);

% Plot median
subplot(2, 3, 6);
bar(1, medianValue);
title('Median');
ylim([0 max([meanValue, stdValue, skewnessValue, kurtosisValue, medianValue, varianceValue])]);

% Adjust layout for better visualization
sgtitle('Statistical Features of the Image');
