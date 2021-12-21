clear all;
close all;
clc;

#----N point DFT function----
#function that calculates N point DFT
function X=NpointDFT(x,N)
  
  #----comparing lengths----
  #comparing length of x and N to check for errors
  L = length(x);
  #if N is lesser than length of x, show error
  if(N<L)
    error('N must be greater than or equal to length of x !');
  end
  #if N is greater than length of x, we need to append x with zeroes
  x = [x zeros(1,N-L)];
  
  #----output----
  #output will be of length N
  X = zeros(1,N);
  
  #----N point DFT----
  #external summation
  for(k = 0:N-1)
    #internal summation
    for(n = 0:N-1)
      #N point DFT equation
      X(k+1) = X(k+1) + x(n+1) * exp(-j*2*pi*k*n/N);
    end
  end
end

#----input signal----
#taking sampling frequency as 500Hz
sampling_freq = 500;
#time vector
t = 0:1/sampling_freq:1-1/sampling_freq;
#taking a sinusoidal input signal
x = 5*sin(2*pi*100*t);
#defining N
N = length(x);
#defining frequency for plotting
freq = linspace(-sampling_freq/2,sampling_freq/2,N);

#----function call----
X = fftshift(NpointDFT(x,N));

#----magnitude spectrum----
stem(freq,abs(X));
xlabel('Frequency[Hz]');
ylabel('Magnitude');
title('Magnitude spectrum');

#----phase spectrum----
stem(freq,angle(X));
xlabel('Frequency[Hz]');
ylabel('Phase');
title('Phase spectrum');