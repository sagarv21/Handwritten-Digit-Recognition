function [labels ] = test_lr(phi,wnew)

% d0=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\test features\zero.xlsx');
% d1=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\test features\one.xlsx');
% d2=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\test features\two.xlsx');
% d3=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\test features\three.xlsx');
% d4=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\test features\four.xlsx');
% d5=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\test features\five.xlsx');
% d6=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\test features\six.xlsx');
% d7=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\test features\seven.xlsx');
% d8=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\test features\eight.xlsx');
% d9=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\test features\nine.xlsx');
% 
% phi0=d0(1:1500,:);
% phi1=d1(1:1500,:);
% phi2=d2(1:1500,:);
% phi3=d3(1:1500,:);
% phi4=d4(1:1500,:);
% phi5=d5(1:1500,:);
% phi6=d6(1:1500,:);
% phi7=d7(1:1500,:);
% phi8=d8(1:1500,:);
% phi9=d9(1:1500,:);
% phitemp=[phi0; phi1; phi2; phi3; phi4; phi5; phi6; phi7; phi8; phi9];
% phi=[ones(15000,1) phitemp];


a=ones(1500,1);
b=zeros(1500,1);

y0=[a b b b b b b b b b];
y1=[b a b b b b b b b b];
y2=[b b a b b b b b b b];
y3=[b b b a b b b b b b];
y4=[b b b b a b b b b b];
y5=[b b b b b a b b b b];
y6=[b b b b b b a b b b];
y7=[b b b b b b b a b b];
y8=[b b b b b b b b a b];
y9=[b b b b b b b b b a];

y=[y0; y1; y2; y3; y4; y5; y6; y7; y8; y9];


format long;

a = exp(phi*wnew);
temp=sum(a,2);

for i=1:15000
   for j=1:10
       prob1(i,j)=a(i,j)/temp(i,1);
   end
end

accuracy=0;

for i=1:15000
    for j=1:10
        accuracy=accuracy+((-1)*(y(i,j)*log(prob1(i,j))));
    end
end



errorcount=0;
[r, x]=max(prob1,[],2);
prob1(:,:)=0; 
for i=1:15000
    prob1(i,x(i))=1; 
    if(isequal(prob1(i,:),y(i,:))~=true)
        errorcount=errorcount+1;
    end
end

errorrate=(errorcount/1500)*100;

x=x-1; 
dlmwrite('classes_nn.txt',x); 
labels=x; 
%end
    




