% Create Random Noise and Display Histograms
rng default  % Set random seed for reproducibility
gaussianNoise = randn(1, 1000);  % Generate Gaussian noise
rayleighNoise = raylrnd(1, 1, 1000);  % Generate Rayleigh noise
ricianNoise = sqrt((randn(1, 1000)).^2 + (randn(1, 1000) + 1).^2);  % Rician noise
uniformNoise = rand(1, 1000);  % Generate Uniform noise

% Plot Histograms
figure;
subplot(2,2,1); histogram(gaussianNoise); title('Gaussian Noise');
subplot(2,2,2); histogram(rayleighNoise); title('Rayleigh Noise');
subplot(2,2,3); histogram(ricianNoise); title('Rician Noise');
subplot(2,2,4); histogram(uniformNoise); title('Uniform Noise');
