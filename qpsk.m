span = 10;          % Filter span
rolloff = 0.2;      % Rolloff factor
sps = 8;            % Samples per symbol
M = 4;              % Modulation alphabet size
k = log2(M);        % Bits/symbol
phOffset = pi/4;    % Phase offset (radians)

filtCoeff = rcosdesign(rolloff,span,sps);
data = randi([0 M-1],5000,1);
dataMod = pskmod(data,M,phOffset);
txSig = upfirdn(dataMod,filtCoeff,sps);

h = scatterplot(sqrt(sps)*txSig(sps*span+1:end-sps*span),sps,0);
hold on
scatterplot(dataMod,1,0,'r+',h)
legend('Transmit Signal','Ideal','location','best')
