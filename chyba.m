%V�po�et chyby dvou soubor� dat p�epo�ten� na bity. input1,input2 dva datov� soubory, delka-pocet bit� 
function [output] =chyba(input1,input2,delka)
output=sum(abs((double(input1)-double(input2))))/(length(input1)*2^delka)*delka; %v�po�et chyby p�eveden� na po�et bit�
end