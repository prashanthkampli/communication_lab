bps = 4;    % Bits per symbol
M = 2^bps;  % 16QAM
nFFT = 128; % Number of FFT bins

txsymbols = randi([0 M-1],nFFT,1);
txgrid = qammod(txsymbols,M,UnitAveragePower=true);
txout = ifft(txgrid,nFFT);
stem(1:nFFT,real(txout))

% Apply an FFT and QAM demodulation
rxin = awgn(txout,40);
rxgrid = fft(rxin,nFFT);
rxsymbols = qamdemod(rxgrid,M,UnitAveragePower=true);
if isequal(txsymbols,rxsymbols)
    disp("Recovered symbols match the transmitted symbols.")
else
    disp("Recovered symbols do not match transmitted symbols.")
end
