fs = 1e7;  % Sampling frequency
interpFactor = 2;  % For better spectrum viewing
time = (0:127)/fs;  % Time vector
hiRateSignal = rectpulse(randn(1, 128), interpFactor);  % High-rate signal
lowRateSignal = rectpulse(hiRateSignal(1:64), interpFactor);  % Low-rate signal
channelImpulse = [0.8 -0.5 0.34];  % Channel impulse response

% Plot in Time Domain
figure;
plot(time, hiRateSignal(1:128), 'y', time, lowRateSignal(1:128), 'b');
hold on;
stem(time(1:length(channelImpulse)), channelImpulse, 'r');
legend('High-rate signal', 'Low-rate signal', 'Channel impulse');
