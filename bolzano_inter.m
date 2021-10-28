function [ps_k,ks,as_k,bs_k,f_a,f_b,f_pks,p_k,f_pk] = bolzano_inter (f,a,b,n,N,Tol)
if a < b
    g = @(x) f(x) - n;
    [ps_k,ks,as_k,bs_k,f_a,f_b,f_pks,p_k,f_pk] = localizacion_raiz(g,a,b,N,Tol);
    f_pk = f_pk + n;
    f_pks = f_pks +n;
    f_b = f_b +n;
    f_a = f_a+ n;
elseif a > b
    g = @(x) n - f(x);
    [ps_k,ks,as_k,bs_k,f_a,f_b,f_pks,p_k,f_pk] = localizacion_raiz(g,a,b,N,Tol);
    f_pk = f_pk - n;
    f_pks = f_pks -n;
    f_b = f_b -n;
    f_a = f_a -n;
end
    
    

end