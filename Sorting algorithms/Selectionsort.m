clear all
close all
clc

#----Selection sort visualizer----
disp("----Selection sort visualizer----");
#x stores number of values
prompt = "Enter number of values :- ";
x = input(prompt);
#lst stores random number list of x values
lst = randi([1,100],1,x);

#list before selection sort algorithm is executed
disp("Before selection sort :-");
disp(lst);
n = size(lst,2);

for i = 1:n
  min = i;
  for j = (i+1):n
    if lst(min) > lst(j)
      min = j;
    endif
    #plotting intermediate results of selection sort algorithm
    b = bar(n,lst,0.5,'g');
    title('Selection sort','Color','g','FontSize',40,'FontAngle','italic');
    set(b(j),'FaceColor','c');
    set(b(min),'FaceColor','b');
    pause(0.5);
  endfor
  if min != i
    temp = lst(min);
    lst(min) = lst(i);
    lst(i) = temp;
    #plotting intermediate results of selection sort algorithm
    c = bar(n,lst,0.5,'g');
    title('Selection sort','Color','g','FontSize',40,'FontAngle','italic');
    set(c(i),'FaceColor','b');
    set(c(min),'FaceColor','c');
    pause(0.5);
  endif
endfor

#list after selection sort algorithm is executed
disp("After selection sort :-");
disp(lst);
#plotting list after selection sort algorithm is executed
bar(n,lst,0.5,'r');
title('Selection sort','Color','r','FontSize',40,'FontAngle','italic');