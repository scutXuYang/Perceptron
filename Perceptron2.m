%%perceptron
clc
clear

%load the data
data=load('testSet2.txt');
%Sometimes you do not need too precise data
% data=roundn(data,-1); 
%au.xuyang@qq.com

x=[data(:,1),data(:,2)];
y=data(:,3);
k=length(y);

%plot the data point based on the label
for j=1:k
    if y(j)==1
     plot(x(j,1),x(j,2),'o');
%      L={num2str(j)};
%      text (x(j,1),x(j,2),L);
     hold on
    end
    if y(j)==-1
     plot(x(j,1),x(j,2),'x');
%      L={num2str(j)},
%      text (x(j,1),x(j,2),L);
     hold on
    end 
end     

%initialize the parameters
a=zeros(1,k);
b=0;
sum1=0;
sum2=0;
r=1;
con=0;
t=0;

while con==0
  for j=1:k
     sum1=sum1+a(j)*y(j)*x(j,1); 
     sum2=sum2+a(j)*y(j)*x(j,2);
  end

  for i=1:k
      if y(i)*(sum1*x(i,1)+sum2*x(i,2)+b)<=0
          a(i)=a(i)+r;
          b=b+y(i)*r;
          t=t+1;
      end   
  end
  con=((y(i)*(sum1*x(i,1)+sum2*x(i,2)+b)>0)&&sum2~=0)||t>1000;
end  
 

xt=-2:0.1:10;
yt=(sum1*xt+b)/sum2
plot(xt,yt);
  







