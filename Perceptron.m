%%perceptron
clc
clear

%load the data
data=load('testSet.txt');
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
w=[0,0];
b=0;
r=0.5;  %learningrate

con=0;  %set the condition
t=0;    %record the number of iterations
br=[];  %record the change of b
wr=[];  %record the change of w


while con==0
   for i=1:k
     if (y(i)*(dot(w,x(i,:))+b))<=0
      w(1)=w(1)+r*y(i)*x(i,1);
      w(2)=w(2)+r*y(i)*x(i,2);
      b=b+r*y(i);
      w=[w(1),w(2)];
      wr=[wr;w];
      br=[br,b];
      t=t+1;
%        if roundn(w(1),-1)~=0
%          yt=(-w(1)*xt-b)/w(2);
%          plot(xt,yt);
%        end  
     end
%       con(i);    
%       p=(con(i)>0)
%       a1=a1 && (con(i)>0 && w(1)~=0)
   end 

   for i=1:k
      con1(i)=(y(i)*(dot(w,x(i,:))+b));
   end
   con=(all(con1(:)>0))
end

xt=-2:0.1:10;
yt=(-w(1)*xt-b)/w(2);
plot(xt,yt);






