function [P] = vanDerWaals_isothermes(T,V)
% ============================= % 
% Renvoie la pression selon le volume molaire pour un gaz de Van der Waals 
% à une température donnée. 
% ============================= % 
% Paramètres : 
% T (float) : Température en Kelvin du gaz
% V (array) : Volume molaire en L/mol
% ============================= % 
% Retours : 
% P (array) : Pression du gaz en Bar
% ============================= %
    P = R * T ./ (V - b) - a ./ (V.*V);
end
