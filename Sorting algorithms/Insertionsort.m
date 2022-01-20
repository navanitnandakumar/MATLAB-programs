clear all
close all
clc

#----Insertion sort visualizer----
disp("----Insertion sort visualizer----");
#x stores number of values
prompt = "Enter number of values :- ";
x = input(prompt);
#lst stores random number list of x values
lst = randi([1,x],1,x);

#list before insertion sort algorithm is executed
disp("Before insertion sort :-");
disp(lst);
#n stores size of list in the second axis
n = size(lst,2);
#plotting list before insertion sort algorithm is executed
bar(n,lst,0.5,'r');
title('Insertion sort','Color','r','FontSize',40,'FontAngle','italic');
pause(0.5);

#----Insertion sort algorithm----
for i = 1:(n-1)
  j = i+1;
  while j>1 && lst(j-1)>lst(j)
    temp = lst(j-1);
    lst(j-1) = lst(j);
    lst(j) = temp;
    j = j-1;
    #plotting intermediate results of insertion sort algorithm
    b = bar(n,lst,0.5,'g');
    title('Insertion sort','Color','g','FontSize',40,'FontAngle','italic');
    set(b(j),'FaceColor','b');
    set(b(1:(j-1)),'FaceColor','c');
    pause(0.5);
  endwhile
endfor

#list after insertion sort algorithm is executed
disp("After insertion sort :-");
disp(lst);
#plotting list after insertion sort algorithm is executed
bar(n,lst,0.5,'r');
title('Insertion sort','Color','r','FontSize',40,'FontAngle','italic');