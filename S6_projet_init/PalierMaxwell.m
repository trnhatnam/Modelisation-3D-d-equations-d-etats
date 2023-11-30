function [Vr_G, Vr_L, Pr_sat] = PalierMaxwell(Tr, epsilon)
% ============================= % 
% Renvoie les volumes molaires réduits de la phase gaz
% et liquide, ainsi que la pression saturante réduite
% pour une température réduite donnée. 
% ============================= % 
% Paramètres : 
% T (float) : Température réduite (sans dimension)
% ============================= % 
% Retours : 
% Vr_G (float) : Volume molaire phase gaz réduit (sans dimension)
% Vr_L (float) : Volume molaire phase liquide réduit (sans dimension)
% Pr_sat (float) : Pression saturante réduite (sans dimension)
% ============================= %
    
    delta = 1;
    % Initialisation
    Pmin = 0;
    Pmax = 1;
    P0 = 0.5;

    while abs(delta) > epsilon
        a0 = -1/P0;
        a1 = 3/P0;
        a2 = -(P0+8*Tr)/(3*P0);
        a3 = 1;
        %   --> Recherche des racines
        r = sort(roots([a3 a2 a1 a0]));
        % Raisonnement par dichotomie
        % Si il y a une racine  réelle et deux complexes Psat > P0
        if isreal(r) && all(r > 1/3)
            Vr_L = r(1);
            Vr_mid = r(2);
            Vr_G = r(3);
            delta = getDeltaR(Vr_L, Vr_mid, Vr_G, P0, Tr);
            % Si il y en a 3 on calcule le delta 
            if delta > 0
                Pmin = P0;
                P0 = (P0 + Pmax) / 2;
            elseif delta < 0
                Pmax = P0;
                P0 = (P0 + Pmin) / 2;
            end
        else
            P0 = Pmin + rand * (Pmax - Pmin);
        end
    end
    Pr_sat = P0;
end