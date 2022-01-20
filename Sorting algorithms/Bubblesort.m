clear all
close all
clc

#----Bubble sort visualizer----
disp("----Bubble sort visualizer----");
#x stores number of values
prompt = "Enter number of values :- ";
x = input(prompt);
#lst stores random number list of x values
lst = randi([1,100],1,x);

#list before bubble sort algorithm is executed
disp("Before bubble sort :-");
disp(lst);
#n stores size of list in the second axis
n = size(lst,2);
#plotting list before bubble sort algorithm is executed
bar(n,lst,0.5,'r');
title('Bubble sort','Color','r','FontSize',40,'FontAngle','italic');
pause(0.5);

#----Bubble sort algorithm----
for i = 1:(n-1)
  for j = 1:(n-i)
    if lst(j) > lst(j+1)
      temp = lst(j);
      lst(j) = lst(j+1);
      lst(j+1) = temp;
    endif
    #plotting intermediate results of bubble sort algorithm
    b = bar(n,lst,0.5,'g');
    title('Bubble sort','Color','g','FontSize',40,'FontAngle','italic');
    set(b(j),'FaceColor','c');
    set(b(j+1),'FaceColor','b');
    pause(0.5);
  endfor
endfor

#list after bubble sort algorithm is executed
disp("After bubble sort :-");
disp(lst);
#plotting list after bubble sort algorithm is executed
bar(n,lst,0.5,'r');
title('Bubble sort','Color','r','FontSize',40,'FontAngle','italic');