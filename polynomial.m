clc 
clear all 
close all 
n=input('enter the length of the codeword'); 
k=input('enter the message length'); 
m=input('enter the message bits'); 
%m=input('msg') 
disp('Generate the Generator Sequence') 
G=cyclpoly(n,k,'max')  %generator sequence 
disp('Generate the Generator Polynomial'); 
g=poly2sym(G) %generator polynomial 
disp('Encoded bits'); 
C=encode(m,n,k,'cyclic',G) %Encoded bits 
disp('Decoded bits') 
%Remove below 2 comment lines to introduce error 
%C(1)=~C(1) 
%C(2)=~C(2) 
D=decode(C,n,k,'cyclic',G) %decoded bits 
ch=biterr(m,D) 
if(ch==0) 
disp('Message is error free') 
else  
disp('message contains error') 
end 
