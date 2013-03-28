function fsincos2=sincos2(x);
%Grazina funkcijos: f=sin(x)+cos(x) reiksme
%Paleidimas: f=sincos(x), kur x vienmatis vektorius.
%Pvz.: f=sincos2([1.0,1.0]) vietoj kablelio ; td stulpeli rodys
%leistinoji sritis(poaibis apibrezimo srities): [-10;10]x[-10;10]; 
fsincos2=sin(x(1))+cos(x(2)); %x1 kai x asis. o x2 kaip y asis
end