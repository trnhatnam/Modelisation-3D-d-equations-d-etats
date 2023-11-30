function [Pr] = VDW_r_corrected_isothermes(Tr,Vr)
% ============================= % 
% Renvoie la pression réduite selon le volume molaire réduit pour un gaz de Van 
% der Waals à une température donnée. 
% ============================= % 
% Paramètres : 
% Tr (float) : Température réduite (sans dimension)
% Vr (array) : Volume molaire réduit
% ============================= % 
% Retours : 
% Pr (array) : Pression réduite du gaz (sans dimension)
% ============================= %

    % Si on est au dessus de la temp critique on applique la loi non
    % corrigée
    if Tr >= 1
        Pr = 8 * Tr ./ (3 * Vr - 1) - 3 ./ (Vr.*Vr);
    else
        [Vr_G, Vr_L, Pr_sat] = PalierMaxwell(Tr, 1e-4);
        Pr = 1:1:length(Vr);
        for i = 1:1:length(Vr)
            % On vérifie que l'on est entre V_L et V_G
            if Vr(i) >= Vr_L && Vr(i) <= Vr_G
                Pr(i) = Pr_sat;
            % Sinon on applique la loi non corrigée
            else
                Pr(i) = 8 * Tr / (3 * Vr(i) - 1) - 3 / (Vr(i)^2);
            end
        end
    end
end
