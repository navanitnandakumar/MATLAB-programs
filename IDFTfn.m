#----IDFTfn----
function y = IDFTfn(Y)
  #takes Y as input sequence
  #N stores the length of the input sequence
  N = lenght(Y);
  #y stores the output sequence
  y = [];
  #summations of k and n are executed using for loops
  for n = 1:N
    #temp variable that stores each term
    temp = 0;
    for k = 1:N
      temp = temp + Y(K)*exp((j*2*pi*(n-1)*(k-1))/N);
    endfor
    #storing terms to y
    y = [y temp];
  endfor
  #dividing by N to get the result
  y = (1/N)*y;
end
