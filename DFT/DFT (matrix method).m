clear all;
close all;
clc;

#taking N as 4 (4 point DFT)
Ndft = 4;

#twiddle factor
w = exp(-1i*2*pi/Ndft);
#repmat creates required terms of w to complete the matrix
ww = repmat(w,Ndft,Ndft);

n = 0:Ndft-1;
#----DFT (twiddle factor) matrix----
#exponents of each term in twiddle factor matrix
nn = n'*n;
#DFT matrix
W = ww.^nn;

#----input----
x = [5,6,1,2];

#----output----
#fft output (for comparison)
X_fft = fft(x).';
X = W*x';

#----printing results----
#input
'----input----'
x
#to get the original input from DFT output
'----original input from output----'
x_original = conj(W)*X/Ndft
#fft output
'----fft output----'
X_fft
#output from matrix method
'----output----'
X