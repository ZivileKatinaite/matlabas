function [fMin2visi,vidurkis] = AdaptyvusMonteKarlo2(funkcija,a1,b1) %ka perduodam
% Monte Carlo (Adaptyvus) metodo realizacija              %FUNKCIJA PERDUODAM
%1. Sugeneruojame 100 atsitiktiniu tasku int [a;b]
%2. Surandame, kuriame fcija igyja didz.(maz) reiksme
%a1=-10;   %pradine sritis
%b1=10;
%PALEIDIMAS: Pvz.
%  a1=-10; b1=10; funkcija =@branin;
%  [fMin2visi, VID] = AdaptyvusMonteKarlo2(funkcija,a1,b1)
fMin2visi=[];
%fMax2visi=[];
for k=1:10
n=2; %dimensija (matavimas)
k1=70; %tasku (vektoriu) skaicius; 
x1=a1 + (b1-a1).* rand(k1,n); %generuoja k1 tasku dvimaciu 
%rand(100,1) meta skaicius kurie yra tarp nulio ir vieno, viska
%100 skaiciu i du stulpelius ismeta
%sincos(x(1)) paskaiciuos pirmo x reiksme fcijos
f1 = [];
for i=1:k1   %kad tiksliau butu reikia imti daugiau reiksmiu
    f1(i)=funkcija(x1(i,:)); %imame eilute visa, perduodam reiksmes x1 x2
end
[fMin1,indMin1]=min(f1); %suranda eilute kurioj yra ta min reiksme
[fMax1,indMax1]=max(f1)
xMin1=x1(indMin1,:); %kad paimtu visa ta eilute su abiem reiksmem
xMax1=x1(indMax1,:)
%fprintf('Surastas min1 = %6.4f, taske x1 = (%6.4f, %6.4f) \n',fMin1,xMin1(1),xMin1(2))
%fprintf('Surastas max1 = %6.4f, taske x1 = (%6.4f, %6.4f) \n',fMax1,xMax1(1),xMax1(2))
%min ir max reiksmes turi but nedaugiau kaip 2 ir nemaziau kaip -2
hold on; %viska i viena brezti
scatter(x1(:,1),x1(:,2),'b.');
scatter(xMin1(1),xMin1(2),'g*');
text(xMin1(1)+0.3,xMin1(2),num2str(fMin1));
rectangle('Position',[-10.0,-10.0,20.0,20.0],...
    'LineWidth',5,'LineStyle','--')

%kitus 50 bandymu atliekame kitoje 10% sumazintoje srityje
%{ 
if xMin1(1)>10-1
    xMin1(1)=10-1
elseif xMin1(1)<-10+1
    xMin1(1)=-10+1
    %a21=8;
end
if xMin1(2)<-10+1
    xMin1(2)=-10+1
elseif  xMin1(2)>10-1
    xMin1(2)=10-1
end
%}

a21=xMin1(1)-1;       %sumazinta sritis minimumui
b21=xMin1(1)+1;
a22=xMin1(2)-1; 
b22=xMin1(2)+1;
%{
a31=xMax1(1)-1;       %sumazinta sritis maximumui
b31=xMax1(1)+1;
a32=xMax1(2)-1; 
b32=xMax1(2)+1;
%}
k2=30;               %tasku (vektoriu) skaicius; 
if (b21>10)  
    b21=10
    a21=8
end
if (a21<-10) 
    a21=-10
    b21=-8
end
if (a22<-10) 
    a22=-10
    b22=-8
end
if  (b22>10)
    b22=10
    a22=8
end
%{
if (b31>10)  
    b31=10
    a31=8
end
if (a31<-10) 
    a31=-10
    b31=-8
end
if (a32<-10) 
    a32=-10
    b32=-8
end
if  (b32>10)
    b32=10
    a32=8
end
%}
x2(:,1)=a21 + (b21-a21).* rand(k2,1); %generuoja x tskus; galim parasyt x2_1=
x2(:,2)=a22 + (b22-a22).* rand(k2,1); %generuoja y tskus; galim x2_2=
%x3(:,1)=a31 + (b31-a31).* rand(k2,1); 
%x3(:,2)=a32 + (b32-a32).* rand(k2,1); 
f2 = [];
f3 = [];
for i=1:k2   %kad tiksliau butu reikia imti daugiau reiksmiu
    f2(i)=funkcija(x2(i,:)); %imame eilute visa, perduodam reiksmes x1 x2
    %f3(i)=funkcija(x3(i,:));
end
[fMin2,indMin2]=min(f2); %suranda eilute kurioj yra ta min reiksme
[fMax2,indMax2]=max(f2);
xMin2=x2(indMin2,:);%kad paimtu visa ta eilute su abiem reiksmem
xMax2=x2(indMax2,:)
%fprintf('Surastas min2 = %6.4f, taske x2 = (%6.4f, %6.4f) \n',fMin2,xMin2(1),xMin2(2))
%fprintf('Surastas min2 = %6.4f, taske x2 = (%6.4f, %6.4f)\n',fMax2,xMax2(1),xMax2(2)) 
hold on; %viska i viena brezti
scatter(x2(:,1),x2(:,2),'b.');
scatter(x3(:,1),x3(:,2),'b.');
scatter(xMin2(1),xMin2(2),'r*');
scatter(xMax2(1),xMax2(2),'y*');
rectangle('Position',[a21,a22,2.0,2.0],...
   'LineWidth',2,'LineStyle','--')
rectangle('Position',[a31,a32,2.0,2.0],...
   'LineWidth',2,'LineStyle','--')
fMin2visi=[fMin2visi;fMin2];
%fMax2visi=[fMax2visi;fMax2];
%figure;
end
MINvidurkis = mean(fMin2visi);
% rectangle pirmi du sk staciakampio apatinis tsk. o kiti intervalo ilgio virsut tsk
%grafikas2