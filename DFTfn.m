#----DFTfn----
function X = DFTfn(x)
  #takes x as input sequence
  # N stores the length of input sequence
  N = length(x);
  #X stores output sequence
  X = [];
  #summations of k and n executed using for loops
  for k = 1:N
    #temp variable that stores terms
    temp = 0;
    for n = 1:N
      temp = temp + x(n)*exp((-1*i*2*pi*(k-1)*(n-1))/N);
    endfor
    #storing terms to X
    X = [X temp];
  endfor
end