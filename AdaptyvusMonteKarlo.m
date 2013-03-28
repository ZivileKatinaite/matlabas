% Monte Carlo (Random search) metodo realizacija
%1. Sugeneruojame 100 atsitiktiniu tasku int [a;b]
%2. Surandame, kuriame fcija igyja didz.(maz) reiksme
a=-10;
b=10;
x=a + (b-a).* rand(100,1); %generuoja vienmati vektoriu, reikia generuoti dvimati
%rand(100,1) meta skaicius kurie yra tarp nulio ir vieno, viska
%100 skaiciu i viena stulpeli ismeta
%sincos(x(1)) paskaiciuos pirmo x reiksme fcijos
f=sincos(x);
%ieskosim min ir max
[fMin,indMin]=min(f); 
[fMax,indMax]=max(f);
xMin=x(indMin);
xMax=x(indMax);
fprintf('Surastas min = %6.4f, taske x = %6.4f \n',fMin,xMin)
fprintf('Surastas max = %6.4f, taske x = %6.4f \n',fMax,xMax)
grafikas