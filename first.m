w1=[1 6 ; 7 2; 8 9; 9 9; 4 8; 8 5];
%w1=[1 6 ; 7 2; 8 9; 9 9; 4 8; 8 5;6 6;0.6 5.7;1 7];
%w2=[2 1;3 3; 2 4; 7 1; 1 3; 5 2;4 1;7.5 1;3 1];
w2=[2 1;3 3; 2 4; 7 1; 1 3; 5 2];
%w1=[6 6;0.6 5.7;1 7];
%w2=[4 1;7.5 1;3 1];
a=[1,1,1];
b=0;
n=0.1;
[a1,x]=singlesamp(w1,w2,a,b,n);
n=1;
b=30;
[a2,x2]=singlesampmargin(w1,w2,a,b,n);
n=2;
[a3,x3]=relaxation(w1,w2,a,b,n);
%b1=[1;1;1;1;1;1;1;1;1;1;1;1]
%b1=[1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1]
b1=ones(length(x),1);
s=size(b1)
n=0.001;
[a4,x4]=lms(w1,w2,a,b1,n);
%disp(a1);
%disp(x);
figure;
%plot(w1(1:6,1),w1(1:6,2),'pr')
plot(w1(1:length(w1),1),w1(1:length(w1),2),'pr')
hold;
axis([0,15,0,15])
%plot(w2(1:6,1),w2(1:6,2),'pb')
plot(w2(1:length(w2),1),w2(1:length(w2),2),'pb')
plot([0,-a1(3)/a1(1)],[-a1(3)/a1(2),0],'k')
plot([0,-a2(3)/a2(1)],[-a2(3)/a2(2),0],'r')
plot([0,-a3(3)/a3(1)],[-a3(3)/a3(2),0],'b')
plot([0,-a4(3)/a4(1)],[-a4(3)/a4(2),0],'c')
legend('w1','w2','single perceptron without margin','single perceptron with margin','relaxation  with margin','LMS-procedure')