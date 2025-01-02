M = 4;  % QPSK modulation
k = log2(M);  % Bits per symbol
numSC = 128;  % OFDM subcarriers
cpLen = 16;   % Cyclic prefix length

% Generate Random Bits
dataIn = randi([0 1], k*numSC, 1);

% Modulate with QPSK
qpskMod = comm.QPSKModulator('BitInput', true);
qpskSig = qpskMod(dataIn);

% Simulate OFDM
ofdmMod = comm.OFDMModulator('FFTLength', numSC, 'CyclicPrefixLength', cpLen);
txSig = ofdmMod(qpskSig);

disp('QPSK transmission complete.');
