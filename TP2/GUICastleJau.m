 function GUICastleJau
    % Create a figure and axes
    f = figure('Visible','off');
    set(f, 'Position', [0, 0, 1024, 768]);
    ax = axes('Units','pixels');  
    
    n = 3;
    Px = rand(1, n);
    Py = rand(1, n);
    Pz = rand(1, n);
    
    [Pnx, Pny, Pnz] = CastelJau(Px, Py, Pz, 0:0.001:1);

    %  On trace une droite passant par nos point originaux
    plot3(Px, Py, Pz, 'color', 'b');
    hold on;
    % On trace notre courbe de bezier.
    plot3(Pnx, Pny, Pnz, 'color', 'r');
    
   % Create slider
    sld = uicontrol('Style', 'slider',...
        'Min',0,'Max',1,'Value',0,...
        'Position', [20 20 400 20],...
        'Callback', @surfzlim); 
    
    % Make figure visble after adding all components
    set(f, 'Visible', 'on');
    % This code uses dot notation to set properties. 
    % Dot notation runs in R2014b and later.
    % For R2014a and earlier: set(f,'Visible','on');
    
    fp = 0;
    fnp = zeros(1, n);

    function surfzlim(source,callbackdata)
        
        if fp ~= 0
            delete(fp);
        end
        
        for i=1:n
            if fnp(i) ~= 0
                delete(fnp(i));
            end
        end
        
        
        val = get(source,'Value');
         
        [nPx, nPy, nPz, tmp] = CastelJau(Px, Py, Pz, val);
         
        fp = plot3(nPx, nPy, nPz, 'C*');
        
        for i=3:n
            lx = [tmp(1, i-1, i-1), tmp(1, i, i-1)];
            ly = [tmp(2, i-1, i-1), tmp(2, i, i-1)];
            lz = [tmp(3, i-1, i-1), tmp(3, i, i-1)];
            fnp(i) = line(lx, ly, lz, 'color', 'g');
        end
        
        
         
        disp(tmp);
        %disp(tmp(1, 2, 2));
         
    end
end