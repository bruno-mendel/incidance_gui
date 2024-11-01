%%

function my_shape
    f = figure(1);
    
    % Boutons radio
    d = uicontrol(f, 'style', 'radiobutton', 'string', 'option 1');
    d.Position = [20 150 100 30];  % Position ajustée plus haut
    d.Callback = @check1;
    
    e = uicontrol(f, 'style', 'radiobutton', 'string', 'option 2');
    e.Position = [20 110 100 30];  % Position ajustée plus haut
    e.Callback = @check2;

    % Menu déroulant
    c = uicontrol(f, 'style', 'popupmenu');
    c.Position = [20 70 100 20];  % Position ajustée pour éviter le chevauchement
    c.String = {'Profil', 'Ball', 'Plate'};
    c.Callback = @selection;
    
    % Fonctions de rappel
    function selection(src, event)
        val = src.Value;
        str = src.String;
        disp(['Sélection : ' str{val}]);
    end

    function check1(src, event)
        disp(['Sélection : ' src.String]);
    end

    function check2(src, event)
        disp(['Sélection : ' src.String]);
    end
end
