 function GUICastleJau
    % Cree la figure
    f = figure('Visible','off');
    set(f, 'Position', [0, 0, 1024, 768]); 
    
    % On definit nos point de support
    n = 4;
    Px = rand(1, n);
    Py = rand(1, n);
    Pz = rand(1, n);
    
    % On calcule notre courbe de bezier avec CastleJau
    [Pnx, Pny, Pnz] = CastelJau(Px, Py, Pz, 0:0.001:1);

    %  On trace une droite passant par nos point originaux
    plot3(Px, Py, Pz, 'color', 'b');
    hold on;
    % On trace notre courbe de bezier.
    plot3(Pnx, Pny, Pnz, 'color', 'r');
    
   % On cree un slider qui controle la valeur de t
    sld = uicontrol('Style', 'slider',...
        'Min',0,'Max',1,'Value',0,...
        'Position', [20 20 400 20],...
        'Callback', $@$slidePoint); 
    
    % On rend la figgure fisible une fois que tout les element on ete
    % ajoute
    set(f, 'Visible', 'on');
    
    % Ne connaissant pas la valeur NULL sous matlab, nous utilisont 0.
    % Ces variable contienne les different segment et le point qui se
    % deplace le long de la courbe
    fp = 0;
    fnp = zeros(n, n-1);

    function slidePoint(source,callbackdata)
        % Si on a deja dessiner le point, on l'efface
        if fp ~= 0
            delete(fp);
        end
        
        % Si on a deja dessiner les segment, on les effaces
        for i=1:n
            for j=1:n-1
                if fnp(i, j) ~= 0
                    delete(fnp(i, j));
                end
            end
        end
        
        % On recupere la valeur du slider
        val = get(source,'Value');
         
        % On calcule la position du point par rapport a notre slider et on
        % recupere les calcule intermediaire de l'algorithme de CastleJau
        [nPx, nPy, nPz, tmp] = CastelJau(Px, Py, Pz, val);
         
        % On trace notre point
        fp = plot3(nPx, nPy, nPz, 'C*');
        
        for i=3:n
            for j=i-1:n-1
                % On recupere dans les calcule de CastleJau les coordonner
                % des different segments
                lx = [tmp(1, j, i-1), tmp(1, j+1, i-1)];
                ly = [tmp(2, j, i-1), tmp(2, j+1, i-1)];
                lz = [tmp(3, j, i-1), tmp(3, j+1, i-1)];
                % On trace les segments
                fnp(i, j) = line(lx, ly, lz, 'color', 'g');
            end
        end         
    end
end