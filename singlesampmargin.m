function [ a,xr ] = singlesampmargin(w1,w2 ,a,b,n)
	display('singlesamp Margin');
	disp('b=')
	disp(b);
	disp(a);
	x1=[w1,ones(length(w1),1)];
	x2=[w2,ones(length(w1),1)];	%adding a col augmented
	%x=[x1,x2];	
	xr=[x1;x2];
	x2=-1*x2;
	x=[x1;x2];
	disp(x);
	count=0;
	while 1
	flag=0;  
	for i=1:size(x,1)
 	   if a *x(i,:)' <= b
	        flag=1;
	       a=a+n*x(i,:);
	     endif
	 endfor
	 count=count+1;      
	if flag==0
	break
	endif
	%if count >50000
	%	break
	%endif
	endwhile
	disp(count);
	disp(a);
	%figure;
	%plot(x(1:6,1),x(1:6,2),'pr')
	%hold;
	%axis([0,10,0,12])
	%plot(xr(7:12,1),xr(7:12,2),'pb')
	%plot([0,-a(3)/a(1)],[-a(3)/a(2),0],'k')
	
	%legend('w1','w2','single perceptron with margin')
	
endfunction