clear; 
clc; 
close all; 
symbol=[1 2 3 4 5]; 
p=[0.4 0.2 0.2 0.1 0.1]; 
[dict,avglen]=huffmandict (symbol,p) 
samplecode=dict{5,2} 
hcode=huffmanenco(symbol,dict); 
hdhsig=huffmandeco(hcode,dict); 
disp('encoded message'); 
disp(hcode); 
disp('decoded message'); 
disp(hdhsig); 
code_length=length(hcode) 
sum=0 
for m=1:5 
sum=sum+(p(m)*log2(1/p(m))); 
end 
disp('sum='); 
disp(sum); 
efficiency=(sum/avglen)*100
