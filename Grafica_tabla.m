function Grafica_tabla(ps_k,ks,as_k,bs_k,f_a,f_b,f_pks,p_k,f_pk,x,y,animacion)
 %%% Generar la tabla 
    var_names = {'k','a_{k}','b_{k}','p_{k}','f(a_{k})','f(b_{k})','f(p_{k})'};
    T = table(ks',as_k',bs_k',ps_k',f_a',f_b',f_pks','VariableNames',var_names);

    %%% Mostrar la tabla y grafica
    fig = uifigure;
    fig.Position(3:4) = [722 360];

    uit = uitable(fig);
    uit.Data = T;
    uit.Position(3)=290;
    uit.Position(4)=300;
    
    ax = uiaxes(fig);
    ax.Position(1) = 315;
    ax.XLabel.String = 'X';
    ax.YLabel.String = 'F(x)';
    hold (ax,'on')
    plot(ax,x,y)
    if animacion ~= true
        plot(ax,p_k,f_pk,'-o');
    else
        sz =size(f_pks);
       for i= 1:sz(2)
            plot(ax,ps_k(i),f_pks(i),'-o');
            %plot(ax,x,zeros(size(x)) + f_pks(i))
            %plot(ax,zeros(size(y)) + ps_k(i),y)
            drawnow;
            pause(0.3)
        end
    end
 c = num2str(round(p_k,4));
 fc = num2str(f_pk);
 txt = '\leftarrow c =';
 txt2 = ' ,f(c) =';
 str = strcat(txt,c,txt2,fc);
 text(ax,p_k,f_pk,str);
end
