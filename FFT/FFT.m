clear all;
close all;
clc;

#package for spectrogram
pkg load signal

#----Sampling frequency----
#Sampling frequency chosen as 10Mhz
sampling_freq = 10e6;

#----Input signal (real valued)----
#Considering a chirp signal
#Time duration chosen as 100 microseconds
#Starting frequency chosen as 500KHz
#Stop frequency chosen as 1500KHz
time_dur = 100e-6;
start_freq = 500e3;
stop_freq = 1500e3;
#time domain vector : starts at 0, increases at the rate of reciprocal of time period, and stops at time duration - time period
time_pd = 1/sampling_freq;
time_vec = 0:time_pd:time_dur-time_pd;
#signal chosen is sin wave
x = sin(2*pi*(start_freq*time_vec + (stop_freq-start_freq)/(2*time_dur)*time_vec.^2));

#----Plotting x----
plot(time_vec,x);
xlabel('Time in [sec]');
ylabel('Amplitude in [V]');
grid on;

#----FFT----
#Length of frequency domain signal should be same as that of time domain signal
N = length(x);
#frequency domain vector : goes from -(half of sampling frequency) to 0 to (half of sampling frequency-1)
freq_vec = (-N/2:N/2-1)*sampling_freq/N;
#X is frequency domain equivalent of x with N samples
X = fftshift(fft(x,N));

#----Plotting X----
#taking absolute value of X while plotting since X is complex
plot(freq_vec,abs(X));
xlabel('Frequency in [Hz]');
ylabel('Amplitude in [V]');
grid on;

#----Plotting X in dB----
plot(freq_vec,20*log10(abs(X)));
xlabel('Frequency in [Hz]');
ylabel('Amplitude in [dB]');
grid on;

#Similarly,for complex valued version of input signal,

#----Input signal (complex valued)----
f = exp(1*j*(2*pi*(start_freq*time_vec + (stop_freq-start_freq)/(2*time_dur)*time_vec.^2)));
#To get the oter half, use the following value for f instead --> f = exp(-1*j*(2*pi*(start_freq*time_vec + (stop_freq-start_freq)/(2*time_dur)*time_vec.^2)));

#----Plotting f----
plot(time_vec,imag(f));
xlabel('Time in [sec]');
ylabel('Amplitude in [V]');
grid on;

#----FFT----
F = fftshift(fft(f,N));

#----Plotting F----
#Comparing it with the plot of X, only one half of the signal appears
plot(freq_vec,abs(F));
xlabel('Frequency in [Hz]');
ylabel('Amplitude in [V]');
grid on;

#----Plotting F in dB----
#Comparing it with the plot of X in dB, only one half of the signal appears
plot(freq_vec,20*log10(abs(F)));
xlabel('Frequency in [Hz]');
ylabel('Amplitude in [dB]');
grid on;

#----Spectrogram----
specgram(x,128,sampling_freq);
specgram(X,128,sampling_freq);
specgram(f,128,sampling_freq);
specgram(F,128,sampling_freq);