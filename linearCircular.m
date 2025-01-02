u1 = 1:8;
h = [0.4 1 0.4];

L = length(h);      % Length of channel
N = length(u1);     % Length of input signal
ucp = u1(N-L+1:N);  % Use last samples of input signal as the CP
u2 = [ucp u1];      % Prepend the CP to the input signal
yl2 = conv(u2,h);   % Convolution of input+CP and channel
yl2 = yl2(L+1:end); % Remove CP to compare signals

figure;
stem(yl2,"o")
title("Convolution Results with Cyclic Prefix")
legend("Linear","Circular","Location","northwest")
