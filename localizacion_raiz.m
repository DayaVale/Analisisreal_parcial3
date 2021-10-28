function [ps_k,ks,as_k,bs_k,f_a,f_b,f_pks,p_k,f_pk] = localizacion_raiz(f,a,b,N,Tol)

%Vectores para la tabla
ps_k = []; %Vector con los valores de P_k
ks = []; %Vector con el número de las iteraciones 
as_k = []; %vector de los valores de a en cada iteración
bs_k = []; % vector de los valores de b en cada iteración
f_a = []; % vector de las funcion evaluada en el punto a de cada iteración
f_b =[];% vector de las funcion evaluada en el punto b de cada iteración
f_pks =[]; % vector de las funcion evaluada en el punto p_k de cada iteración

%Variables globales
k = 0; % Inicialización de las iteraciones
a_k = a; % minimo del intervalo
b_k = b; % Maximo del intervalo


if f(a).*f(b) >= 0 % Para seguir con el algoritmo se be cumplir que f(a)f(b)< 0 
    disp("No se puede continuar con el algoritmo");
else 
    while k < N  % Mientras pasa que k < Número de iteraciones debe seguir el algoritmo
        %disp((1/(2^k))*(b-a))
        if (1/(2^k))*(b-a)< Tol % En el caso que se cumpla  esta condiciones nos quiere decir que para cierto k y p_k la longitud es menor que el error
            %disp((1/(2^k))*(b-a))
            return 
        end
        p_k = (a_k + b_k)/2; % Mitad del intervalo asignado
        ps_k(k+1)= p_k; % Ingresar al vector de los p_k
        f_pk = f(p_k); % Evaluación de ese punto medio en la función
        f_pks(k+1) = f_pk; % Ingresa al vector de f_pks
        as_k(k+1) = a_k; %vector de los valores de a en cada iteración
        bs_k(k+1)= b_k ; % vector de los valores de b en cada iteración
        fa = f(a_k); % Función evaluada en a_k
        f_a(k+1)=fa; % Vector de la funcion evaluada en a_k
        fb = f(b_k); % Función evaluada en b_k
        f_b(k+1)= fb; %Vector de la funcion evaluada en b_k
        ks(k+1)= k+1; % Vector de iteraciones comienza desde la 0 
          
        if fa*f_pk < 0 % Primera condición la f(p_k) > 0  Entonces si f(p_k) tiene diferente signo que f(a),
            a_k = a_k;     % f(p_k) esta tomando valores positivos
            b_k = p_k;
        elseif fa*f_pk > 0 % Segunda condición la f(p_k) < 0 Entonces si f(p_k) tiene el mismo signo que f(a),
            b_k = b_k;        % f(p_k) esta tomando valores negativos
            a_k = p_k;
        elseif f_pk == 0 % Tercera condición f(p_k)= 0 esto nos dice por el teorema que ya se encontro la raiz
            disp("Encontro la raíz");
            return
        else
            disp("Falló el método");
            return
        end
        k = k+1; % Se va aumentando el valor de k   
    end
end


end