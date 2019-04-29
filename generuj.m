%Funkce generuje veektor n�hodn�ch ��sel pro n�slednou QAM modulaci, ��sla
%jsou p�eveden� na po�adovan� form�t pro n-bitovou QAM modulaci. Vstupn�
%parametry delka-delka vstupniho vektoru, bity- maxim�ln� hodnota pro n
%bitovou modulaci.
function[A] =generuj(delka,bity)
A=(randi(2^16,delka,1)-1);%generace n�hodn�ho vektoru ��sel p�edpokl�d�me 16bitov� vstup do kodovac�ho �et�zce 
%a� se zbyte�n� negeneruj� p��li� velk� ��sla
A=uint16(floor(A./(2^(16-bity))));

end