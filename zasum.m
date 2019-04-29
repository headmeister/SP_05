%vytvoøí zaèumìný signál, pomocí aditivního komplexního šumu,
%input-komplexní signál, sigma-požadovaný rozptyl aditivního šumu
function[output] =zasum(input,sigma)

noise=sigma*randn(length(input),1)+1i*sigma*randn(length(input),1);%pøièítání adaptivního komplexního šumu
output=input+noise;
end