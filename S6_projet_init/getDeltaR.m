function [deltaR] = getDeltaR(Vr_L, Vr_mid, Vr_G, P0, Tr)
    Pr_centree = @(Vr) 8 *Tr./(3 * Vr-1)- 3./(Vr.*Vr) - P0;
    aireGauche = -integral(Pr_centree,Vr_L,Vr_mid);
    aireDroite = integral(Pr_centree,Vr_mid,Vr_G);
    deltaR = aireDroite - aireGauche;
end