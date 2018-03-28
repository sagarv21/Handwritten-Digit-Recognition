function [wtrain1,wtrain2] = train_nn(phi)

format long;

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
% % Define input matrix phi and add bias to it
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

% Calculate the paramters w1j=w1 and wjk=w2
% 

[N, D] = size(phi);

w1=(rand(513,25)-0.5);
w2=(rand(26,10)-0.5);


% Calculate target matrix y

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


for a=1:3000
    
format long;
aj=phi*w1;
zjold=tanh(aj);
zj=[ones(N,1) zjold];


n1=0.0003;
n2=0.0006;

ak=zj*w2;

tempak=exp(ak);
temp=sum(tempak,2);

for i=1:N
    pk(i,:)=tempak(i,:)/temp(i,1);
end

dk=pk-y;

dzj=1-zj.*zj;
temp2=w2.';

dj=dzj.*(dk*temp2);

djnew=dj(1:N,2:26);


%wnew1=w1-n*(zi.'*(dj));
temp3=zj.';
temp4=phi.';

wtrain1=w1-n1*(temp4*djnew);
wtrain2=w2-n2*(temp3*dk);

w1=wtrain1;
w2=wtrain2;

error(a)=0;

aj1=phi*wtrain1;
zjold=tanh(aj1);

zj1=[ones(N,1) zjold];


ak1=zj1*wtrain2;

tempak1=exp(ak1);
temp5=sum(tempak1,2);

for i=1:N
    pk1(i,:)=tempak1(i,:)/temp5(i,1);

end

 
for i=1:N
    for j=1:10
        error(a)=error(a)+((-1)*(y(i,j)*log(pk1(i,j))));
    end
end

a

if(error(a)<300)
    disp(['error <300']);
    iend=a;
  break;
end

end
iend=a;
x=1:iend;
plot(x,error(x))

end
    