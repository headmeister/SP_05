function [output] =map(input)
output(1:length(input),1)=0;

for(i=1:length(input))%kodovací cyklus (reálná èást)
    switch(input(i))
        case{4,5,6,7}
            output(i)=-5;
        case{8,9,10,11,3,0}
            output(i)=-3;
        case{12,13,14,15,1,2}
            output(i)=-1;
        case{16,17,18,19,30,29}
            output(i)=1;
        case{20,21,22,23,28,31}
            output(i)=3;
        case{24,25,26,27}
            output(i)=5;
    end
    
    switch(input(i)) %% kodovaní imaginární èásti
        case{3,2,31,30}
            output(i)=output(i)-5i;
        case{7,11,15,19,23,27}
            output(i)=output(i)-3i;
        case{6,10,14,18,22,26}
            output(i)=output(i)-1i;
        case{5,9,13,17,21,25}
            output(i)=output(i)+1i;
        case{4,8,12,16,20,24}
            output(i)=output(i)+3i;
        case{0,1,29,28}
            output(i)=output(i)+5i;
    end
end
    
end