function [wnew] = train_lr(phi)

% d0=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\excel features\zero.xlsx');
% d1=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\excel features\ones.xlsx');
% d2=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\excel features\two.xlsx');
% d3=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\excel features\three.xlsx');
% d4=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\excel features\four.xlsx');
% d5=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\excel features\five.xlsx');
% d6=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\excel features\six.xlsx');
% d7=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\excel features\seven.xlsx');
% d8=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\excel features\eight.xlsx');
% d9=xlsread('C:\Users\SAGAR VISHWAKARMA\Desktop\Fall 2013\ML\project 2\excel features\nine.xlsx');
% 
% phi0=d0(1:2000,:);
% phi1=d1(1:1979,:);
% phi2=d2(1:1999,:);
% phi3=d3(1:2000,:);
% phi4=d4(1:2000,:);
% phi5=d5(1:2000,:);
% phi6=d6(1:2000,:);
% phi7=d7(1:2000,:);
% phi8=d8(1:2000,:);
% phi9=d9(1:2000,:);
% phitemp=[phi0; phi1; phi2; phi3; phi4; phi5; phi6; phi7; phi8; phi9];
% phi=[ones(19978,1) phitemp];

w=rand(513,10);

a=ones(2000,1);
b=zeros(2000,1);
c=ones(1979,1);
d=zeros(1979,1);
e=ones(1999,1);
f=zeros(1999,1);


y0=[a b b b b b b b b b];
y1=[d c d d d d d d d d];
y2=[f f e f f f f f f f];
y3=[b b b a b b b b b b];
y4=[b b b b a b b b b b];
y5=[b b b b b a b b b b];
y6=[b b b b b b a b b b];
y7=[b b b b b b b a b b];
y8=[b b b b b b b b a b];
y9=[b b b b b b b b b a];

y=[y0; y1; y2; y3; y4; y5; y6; y7; y8; y9];

y1=1;
for z=1:200

format long;

n=0.0005;

ak = exp(phi*w);
temp = sum(ak,2);

for i=1:19978
   for j=1:10
       prob(i,j)=ak(i,j)/temp(i,1);
   end
end

% for i=1:16000
%    for j=1:10
%        if prob(i,j)==probmax(i,1)
%            prob(i,j)=1;
%        else
%            prob(i,j)=0;
%        end
%    end
% end

wnew=w-n*(phi.'*(prob-y));
w=wnew;

a = exp(phi*w);
temp=sum(a,2);

for i=1:19978
   for j=1:10
       prob1(i,j)=a(i,j)/temp(i,1);
   end
end

accuracy(z)=0;

for i=1:19978
    for j=1:10
        accuracy(z)=accuracy(z)+((-1)*(y(i,j)*log(prob1(i,j))));
    end
end

disp(y1)
y1=y1+1;

if(accuracy(z)<3000)
    disp(['Accuracy <300']);
    iterend=z;
  break;
end
iterend=z;
end

x=1:iterend;
plot(x,accuracy(x));
end
     