%padaryti kad breztu dvimates : surf, mesh tam tinka
x1=-10:0.2:10;
x2=-10:0.2:10;
[X1,X2]=meshgrid(x1,x2);
f=sin(X1)+cos(X2);
mesh(X1,X2,f)
