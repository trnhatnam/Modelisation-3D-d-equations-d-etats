function [Pr] = vanDerWaals_reduite_isothermes(Tr,Vr)
% ============================= % 
% Renvoie la pression réduite selon le volume molaire réduit pour un gaz de Van 
% der Waals à une température donnée. 
% ============================= % 
% Paramètres : 
% T (float) : Température réduite (sans dimension)
% V (array) : Volume molaire réduit
% ============================= % 
% Retours : 
% P (array) : Pression réduite du gaz (sans dimension)
% ============================= %

    Pr = 8 * Tr ./ (3 * Vr - 1) - 3 ./ (Vr.*Vr);
end