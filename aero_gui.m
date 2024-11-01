%%

function aero_gui
    f = figure(1);
    
    % Panneau pour regrouper les contrôles
    panel = uipanel(f, 'Title', 'Parametre a sellectionner', 'Units', 'normalized', 'Position', [0.05 0.6 0.4 0.35]);  % Position en haut à gauche
    
    % Menu déroulant dans le panneau
    popup = uicontrol(panel, 'style', 'popupmenu', 'Units', 'normalized');
    popup.Position = [0.1 0.7 0.8 0.2];  % Position ajustée à l'intérieur du panneau
    popup.String = {'NACA 0012', 'NACA 2412', 'NACA 4412'};
    popup.Callback = @selection;
    
    % Curseur pour l'angle d'attaque
    angleSlider = uicontrol(panel, 'style', 'slider', 'Units', 'normalized', 'Position', [0.1 0.4 0.8 0.2], 'Min', -10, 'Max', 10, 'Value', 0);
    angleSlider.Callback = @updateAngle;
    
    % Champ de texte pour afficher la sélection
    textDisplay = uicontrol(f, 'style', 'text', 'Units', 'normalized', 'Position', [0.55 0.45 0.4 0.05], 'String', 'Sélection : ');
    
    angleDisplay = uicontrol(f, 'style', 'text', 'Units', 'normalized', 'Position', [0.55 0.4 0.4 0.05], 'String', 'Angle d\attaque : 0°');
    
    % Variable pour stocker l'angle d'attaque
    angleOfAttack = 0;
    
    % Repère à deux axes dans la moitié supérieure droite
    ax = axes(f, 'Units', 'normalized', 'Position', [0.55 0.55 0.4 0.4]);  % Position relative à la figure
    
    % Fonction de rappel pour le curseur
    function updateAngle(src, event)
        angleOfAttack = src.Value;
        disp(['Angle d\attaque : ' num2str(angleOfAttack)]);
        set(angleDisplay, 'String', ['Angle d\attaque : ' num2str(angleOfAttack) '°']);
        updatePlot();
    end

    % Fonction de rappel pour le menu déroulant
    function selection(src, event)
        val = src.Value;
        str = src.String;
        selectedOption = str{val};
        disp(['Sélection : ' selectedOption]);
        set(textDisplay, 'String', ['Sélection : ' selectedOption]);  % Mettre à jour le champ de texte
        updatePlot();
    end

    % Fonction pour mettre à jour le graphique
    function updatePlot()
        ax.XTick = [];
        ax.YTick = [];
        cla(ax);  % Effacer le graphique actuel
        switch popup.String{popup.Value}
            case 'NACA 0012'
                % Exemple de coordonnées pour NACA 0012
                data = load('naca0012.txt');
                title(ax,'Profil aérodynamique NACA 4412');
                x = data(:, 1);
                y = data(:, 2);
                plot(ax, x, y);
                axis equal;
                grid minor;
            case 'NACA 2412'
                % Exemple de coordonnées pour NACA 2412
                data = load('naca2412.txt');
                title('Profil aérodynamique NACA 2412');
                x = data(:, 1);
                y = data(:, 2);
                plot(ax, x, y);
                axis equal;
                grid minor;
            case 'NACA 4412'
                % Exemple de coordonnées pour NACA 4412
                data = load('naca4412.txt');
                title(ax,'Profil aérodynamique NACA 4412');
                x = data(:, 1);
                y = data(:, 2);
                plot(ax, x, y);
                axis equal;
                grid minor;
        end
        % Appliquer la rotation pour l'angle d'attaque
        rotate(ax.Children, [0 0 1], angleOfAttack, [0.5 0 0]);
    end
end
