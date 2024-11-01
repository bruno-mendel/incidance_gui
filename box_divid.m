%%

function box_divid
    f = figure(1);
    
    % Panneau pour regrouper les contrôles
    panel = uipanel(f, 'Title', 'Parametre a sellectionner', 'Units', 'normalized',  'Position', [0.05 0.6 0.4 0.35]);  % Position en haut à gauche
    
    % Menu déroulant dans le panneau
    popup = uicontrol(panel, 'style', 'popupmenu', 'Units', 'normalized');
    popup.Position = [0.1 0.7 0.8 0.2]; % Position ajustée à l'intérieur du panneau
    popup.String = {'NACA 0012', 'NACA 2412', 'NACA 4412'};
    popup.Callback = @selection;
    
    angleSlider = uicontrol(panel, 'style', 'slider', 'Units', 'normalized', 'Position', [0.1 0.4 0.8 0.2], 'Min', -10, 'Max', 10, 'Value', 0);
    angleSlider.Callback = @updateAngle;
    
    textDisplay = uicontrol(f, 'style', 'text', 'Units', 'normalized', 'Position', [-0.1 0.5 0.4 0.05], 'String', 'Sélection : ');
    
    % Repere
    ax = axes(f, 'Units', 'normalized', 'Position', [0.55 0.55 0.4 0.4]);  % Position relative à la figure
    plot(ax, rand(10,1), rand(10,1));  % Exemple de données aléatoires pour le graphique
    
    % Fonction de rappel pour le curseur
    function updateAngle(src, event)
        angleOfAttack = src.Value;
        disp(['Angle d\attaque : ' num2str(angleOfAttack)]);
        %updatePlot();
    end
    
    % Fonction de rappel pour le menu déroulant
    function selection(src, event)
        val = src.Value;
        str = src.String;
        selectedOption = str{val};
        disp(['Sélection : ' selectedOption]);
        set(textDisplay, 'String', ['Sélection : ' selectedOption]);  % Mettre à jour le champ de texte
        % Effacer les graduations du graphique
        ax.XTick = [];
        ax.YTick = [];
        cla(ax);  % Effacer le graphique actuel
        
        switch selectedOption
            case 'NACA 0012'
                plot(ax, rand(10,1), rand(10,1));  % Exemple de tracé de courbe
            case 'NACA 2412'
                scatter(ax, rand(10,1), rand(10,1));  % Exemple de nuage de points
            case 'NACA 4412'
                bar(ax, rand(1,10));  % Exemple d'histogramme
        end
        
    end
end
