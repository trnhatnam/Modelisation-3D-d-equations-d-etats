function [res] = normalisation(mini,maxi,mat)
%NORMALISATION Normalisation de la matrice (tous les élements seront dans
% [-1, 1]
%   On va chercher une fonction affine vérifiant f(maxi) = 1 et f(mini) = 0
%   et on applique cette fonction à res.
res = (1/(maxi-mini))*mat - mini/(maxi-mini);
end

