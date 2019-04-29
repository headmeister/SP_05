%Funkce generuje veektor náhodnıch èísel pro následnou QAM modulaci, èísla
%jsou pøevedená na poadovanı formát pro n-bitovou QAM modulaci. Vstupní
%parametry delka-delka vstupniho vektoru, bity- maximální hodnota pro n
%bitovou modulaci.
function[A] =generuj(delka,bity)
A=(randi(2^16,delka,1)-1);%generace náhodného vektoru èísel pøedpokládáme 16bitovı vstup do kodovacího øetìzce 
%a se zbyteènì negenerují pøíliš velká èísla
A=uint16(floor(A./(2^(16-bity))));

end