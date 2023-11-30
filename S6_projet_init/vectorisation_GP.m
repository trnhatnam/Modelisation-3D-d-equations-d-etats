%% Loi des gaz parfaits


% 1ère étape : expression de T
Ncoupes = 30; % nombre de coupes
Tmax = 1;
rhomax = 1;

rho = linspace(0, rhomax, Ncoupes);
T = linspace(0, Tmax, Ncoupes);

%% 2è étape : sommets et faces 

% travail sur les sommets
Npts = Ncoupes*3;
sommets = zeros(Npts, 3); % chaque slice est un triangle (spécifique à la loi des GP)
for i=1:3:Npts
    j = fix(i/3) + 1;
    % création des coupes
    P = (T(j)*rho);

    %prise du max -> création du vertice
    sommets(i,:) = [0 T(j) 0]; % Ts(j) donne la position du slice
    sommets(i+1,:) = [rhomax T(j) 0];
    sommets(i+2,:) = [rhomax T(j) max(P)];
end

%xlabel('\rho*')
%ylabel('P*')
%title("Isothermes de la loi des gaz parfaits adimensionnée")
%hold off
% travail sur les faces
% faces = reshape(1:Npts, [3,Ncoupes]).'; % style coupe

faces = [];
for i=1:3:Npts-3 % on va travailler entre 2 slices
    faces = [faces [i i+2 i+3] [i+3 i+5 i+2]];
end

% fermeture de la figure
faces = [faces [1 2 Npts-2] [Npts-2 Npts-1 2] [2 Npts-1 Npts] [Npts-2 Npts-1 Npts]];
faces = reshape(faces,3, []).';

%title('Représentation 3d de la loi des GP')
%xlabel('\rho')
%ylabel('T')
%zlabel('P')
%patch ("Vertices",  sommets,  "Faces",  faces, "FaceColor", [0.7, 0.3, 0.2])

% 3ème étape : calcul des vecteurs normales
tri = triangulation(faces, sommets);
stlwrite(tri, "loi_gp.stl")