function [output]=demap(input)
output(1:length(input),1)=0;

kod_mat=[0,0,1,29,28,0;4,8,12,16,20,24;5,9,13,17,21,25;6,10,14,18,22,26;7,11,15,19,23,27;0,3,2,30,31,0];%qam kodovací matice
cil=[-5 -3 -1 1 3 5];

for(i=1:length(input))%dekodovací cyklus
    imagin=interp1(cil,cil,imag(input(i)),'nearest','extrap');
    if(imagin==5 || imagin==-5)
    realn=interp1(cil(2:end-1),cil(2:end-1),real(input(i)),'nearest','extrap');
    else
      realn=interp1(cil,cil,real(input(i)),'nearest','extrap');  
    end
    
    output(i)=kod_mat(cil==-imagin,cil==realn);
    
end


end