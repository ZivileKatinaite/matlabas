function [fMin2visi,fMax2visi,MINvidurkis,MAXvidurkis] = AdaptyvusMonteKarlo2(funkcija,a1,b1) %ka perduodam
% Monte Carlo (Adaptyvus) metodo realizacija              %FUNKCIJA PERDUODAM
%1. Sugeneruojame 100 atsitiktiniu tasku int [a;b]
%2. Surandame, kuriame fcija igyja didz.(maz) reiksme
%a1=-10;   %pradine sritis
%b1=10;

%PALEIDIMAS: Pvz.
%  a1=-10; b1=10; funkcija =@branin;
%  [fMin2visi,fMax2visi,MINvidurkis,MAXvidurkis]=AdaptyvusMonteKarlo2(funkcija,a1,b1)
fMin2visi=[];
fMax2visi=[];
for k=1:10        %cia kad ismestu 10 reiksmiu
    
    n=2; %dimensija (matavimas)
    k1=90; %tasku (vektoriu) skaicius; 
    x1=a1 + (b1-a1).* rand(k1,n); %generuoja k1 tasku dvimaciu 
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
scatter(xMin1(1),xMin1(2),'g+');
scatter(xMax1(1),xMax1(2),'y*');
text(xMin1(1)+0.3,xMin1(2),num2str(fMin1));
text(xMax1(1)+0.3,xMax1(2),num2str(fMax1));
rectangle('Position',[-10.0,-10.0,20.0,20.0],...
    'LineWidth',5,'LineStyle','--')

    %kitus 50 bandymu atliekame kitoje 10% sumazintoje srityje

%sumazinta sritis minimumui
a21=xMin1(1)-1;         %x kairei 
b21=xMin1(1)+1;         %y desnei
a22=xMin1(2)-1;         %x apacia
b22=xMin1(2)+1;         %y virsus
%sumazinta sritis maximumui
a31=xMax1(1)-1;         %x kairei
b31=xMax1(1)+1;         %y desnei
a32=xMax1(2)-1;         %x apacia 
b32=xMax1(2)+1;         %y virsus
n=1;
k2 = 10;
    if (b21>10)  %minimumui
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

    if (b31>10)  %maximumui
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
x2(:,1)=a21 + (b21-a21).* rand(k2,n); %generuoja x tskus; 
x2(:,2)=a22 + (b22-a22).* rand(k2,n); %generuoja y tskus; 

x3(:,1)=a31 + (b31-a31).* rand(k2,n); 
x3(:,2)=a32 + (b32-a32).* rand(k2,n); 
    
    f2 = [];
    f3 = [];
    for i=1:k2   %kad tiksliau butu reikia imti daugiau reiksmiu
         f2(i)=funkcija(x2(i,:)); %imame eilute visa, perduodam reiksmes x1 x2
         f3(i)=funkcija(x3(i,:));
    end
    [fMin2,indMin2]=min(f2); %suranda eilute kurioj yra ta min reiksme
    [fMax2,indMax2]=max(f3);
    xMin2=x2(indMin2,:);%kad paimtu visa ta eilute su abiem reiksmem
    xMax2=x3(indMax2,:)

%fprintf('Surastas min2 = %6.4f, taske x2 = (%6.4f, %6.4f) \n',fMin2,xMin2(1),xMin2(2))
%fprintf('Surastas min2 = %6.4f, taske x2 = (%6.4f, %6.4f)\n',fMax2,xMax2(1),xMax2(2)) 
hold on; %viska i viena brezti
scatter(x2(:,1),x2(:,2),'b.');
scatter(x3(:,1),x3(:,2),'b.');
scatter(xMin2(1),xMin2(2),'g*');
scatter(xMax2(1),xMax2(2),'y+');
text(xMin2(1) + 0.3,xMin2(2),num2str(fMin2));
text(xMax2(1) + 0.3,xMax2(2),num2str(fMax2));
rectangle('Position',[a21,a22,2.0,2.0],...
   'LineWidth',2,'LineStyle','--')
  rectangle('Position',[a31,a32,2.0,2.0],...
   'LineWidth',2,'LineStyle','--')
fMin2visi=[fMin2visi;fMin2];
fMax2visi=[fMax2visi;fMax2];

end

MINvidurkis = mean(fMin2visi);
MAXvidurkis = mean(fMax2visi);

% rectangle pirmi du sk staciakampio apatinis tsk. o kiti intervalo ilgio virsut tsk
%grafikas2