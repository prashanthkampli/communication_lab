K = 3; 
G1 = 7; 
G2 = 5; 
msg = [1 0 1 1 0] 
trel = poly2trellis(K,[G1 G2]); 
coded = convenc(msg,trel) 
%INTRODUCING ERROR 
coded(1)=~coded(1); 
coded(2)=~coded(2) 
%coded(3)=~coded(3); 
%coded(4)=~coded(4); 
%coded(5)=~coded(5); 
tblen = length(msg); 
decoded = vitdec(coded,trel,tblen,'trunc','hard') 
ch = biterr(msg, decoded); % Compare the original message with the decoded sequenc
if (ch == 0) 
disp('The received code is without error'); 
else 
disp('The received code is with error'); 
end
