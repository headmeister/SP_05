%Výpoèet chyby dvou souborù dat pøepoètené na bity. input1,input2 dva datové soubory, delka-pocet bitù 
function [output] =chyba(input1,input2,delka)
output=sum(abs((double(input1)-double(input2))))/(length(input1)*2^delka)*delka; %výpoèet chyby pøevedený na poèet bitù
end