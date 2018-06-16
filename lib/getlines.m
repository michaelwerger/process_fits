%[x,y] = ginput(25)

%hold on
%plot(x,y,'+')
%hold off

%w=x

coeff = polyfit(x,w,1)
figure()
axis([1 1000 5800 7800])
hold on
plot(x,w,'o')
xgrid = 1:10:700;
ygrid = polyval(coeff,xgrid);
plot(xgrid,ygrid,'-')
hold off