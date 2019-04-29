%vytvo�� za�um�n� sign�l, pomoc� aditivn�ho komplexn�ho �umu,
%input-komplexn� sign�l, sigma-po�adovan� rozptyl aditivn�ho �umu
function[output] =zasum(input,sigma)

noise=sigma*randn(length(input),1)+1i*sigma*randn(length(input),1);%p�i��t�n� adaptivn�ho komplexn�ho �umu
output=input+noise;
end