M = 16;            % Modulation order
nFFT = 128;        % FFT size
txsymbols = randi([0 M-1], nFFT, 1);
txgrid = qammod(txsymbols, M, 'UnitAveragePower', true);
txout = ifft(txgrid, nFFT);

% Oversampling
upFactor = 3;  % Oversampling factor
nFFTUp = upFactor * nFFT;
fftgrid = [txgrid(1:nFFT/2); zeros((upFactor-1)*nFFT, 1); txgrid(nFFT/2+1:end)];
txoutUp = ifft(fftgrid, nFFTUp);

% Plot Oversampled Output
figure;
plot(real(txout), 'b'); hold on;
plot(real(txoutUp), 'r'); legend('Original', 'Upsampled');
