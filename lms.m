function [ a,xr ] = lms(w1,w2 ,a,b1,n)
	display('LMS');
	disp(a);
	theta=[9,9,9];
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
	  if abs((n) *(x(i,:))* (b1(i,1)-(a*x(i,:)')) ) < theta
	        flag=1;
		a = a + (n) *(x(i,:))* (b1(i,1)-(a*x(i,:)'));
	     endif
	  % ass=(n/i) *(x(i,:))* (b1(i,1)-(a*x(i,:)'));
	   %disp(ass);
	 endfor
	 count=count+1;      
	if flag==0
	break
	
	endif
	if count >1500
		%disp('Does not converge');
		break
	endif
	endwhile
	
	
	disp(count);
	disp(a);
	%figure;
	%plot(x(1:6,1),x(1:6,2),'pr')
	%hold;
	%axis([0,12,0,12])
	%plot(xr(7:12,1),xr(7:12,2),'pb')
	%plot([0,-a(3)/a(1)],[-a(3)/a(2),0],'k')
	%legend('w1','w2','LMS-procedure')
	
endfunction