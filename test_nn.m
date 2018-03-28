function [errorrate,labels] = test_nn(phi,w1,w2)

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
% phi0=d0(1:150,:);
% phi1=d1(1:150,:);
% phi2=d2(1:150,:);
% phi3=d3(1:150,:);
% phi4=d4(1:150,:);
% phi5=d5(1:150,:);
% phi6=d6(1:150,:);
% phi7=d7(1:150,:);
% phi8=d8(1:150,:);
% phi9=d9(1:150,:);
% phitemp=[phi0; phi1; phi2; phi3; phi4; phi5; phi6; phi7; phi8; phi9];
% phi=[ones(1500,1) phitemp];

[N,D]=size(phi);

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

error=0;

aj1=phi*w1;
zj2=tanh(aj1);

zj1=[ones(N,1) zj2];


ak1=zj1*w2;

tempak1=exp(ak1);
temp7=sum(tempak1,2);

for i=1:N
    pk1(i,:)=tempak1(i,:)/temp7(i,1);
end

 
% for i=1:N
%     for j=1:10
%         error=error+((-1)*(y(i,j)*log(pk1(i,j))));
%     end
% end

errorcount=0;
[r, x]=max(pk1,[],2);
pk1(:,:)=0; 
for i=1:N
    pk1(i,x(i))=1; 
    if(isequal(pk1(i,:),y(i,:))~=true)
        errorcount=errorcount+1;
    end
end

errorrate=(errorcount/N)*100;

x=x-1; 
dlmwrite('classes_nn.txt',x); 
labels=x; 

 
% end
    




