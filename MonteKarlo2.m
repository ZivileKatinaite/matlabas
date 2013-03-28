% Monte Carlo (Random search) metodo realizacija
%1. Sugeneruojame 100 atsitiktiniu tasku int [a;b]
%2. Surandame, kuriame fcija igyja didz.(maz) reiksme
a=-10;
b=10;
n=2; %dimensija (matavimas)
k=1000; %tasku (vektoriu) skaicius
x=a + (b-a).* rand(k,n); %generuoja 1000 tasku dvimaciu 
%rand(100,1) meta skaicius kurie yra tarp nulio ir vieno, viska
%100 skaiciu i du stulpelius ismeta
%sincos(x(1)) paskaiciuos pirmo x reiksme fcijos
for i=1:k   %kad tiksliau butu reikia imti daugiau reiksmiu
    f(i)=sincos2(x(i,:)); %imame eilute visa, perduodam reiksmes x1 x2
end
%ieskosim min ir max
[fMin,indMin]=min(f); %suranda eilute kurioj yra ta min reiksme
[fMax,indMax]=max(f);
xMin=x(indMin,:);%kad paimtu visa ta eilute su abiem reiksmem
xMax=x(indMax,:);
fprintf('Surastas min = %6.4f, taske x = (%6.4f, %6.4f) \n',fMin,xMin(1),xMin(2))
fprintf('Surastas min = %6.4f, taske x = (%6.4f, %6.4f) \n',fMax,xMax(1),xMax(2))
grafikas2
%min ir max reiksmes turi but nedaugiau kaip 2 ir nemaziau kaip -2