%% Finding the sum of a matrix in Excel
data = xlsread("TableEx.xlsx");  %5x3 array
x = size(data); %Dimensions of the array
n = x(1)*x(2); %The amount of numbers is the area
sum = 0;
for i = 1:x(1)
    for j = 1:x(2)
       sum = sum + data(i,j); 
    end
end
mean = sum/n;
disp("The mean of the data is "+num2str(mean))
%% Interpolation of Table B.8
Table = xlsread("TableB8.xlsx"); %Acquire numeric data from Table B8
x = size(Table); %Size of the table: 8x17