%% ---------------------------------- Punto 3 ------------------------------------------------------
% Grafica visualización del 3
n = [-20:0:20];
x = 1./n;
y = 1./(sqrt(3).*n);
f1 = @ (x) x.^2;
f2 = @ (y) -y.^3;

plot(x,f1(x),'-o')
hold on
plot(y,f2(y),'-o')

%% ------------------------------ Punto 4 -------------------------------------------------------------
format long
a = -2; % minimo del interval
b = 1; % Maximo del intervalo
N = 25; % Número de iteraciones
Tol= 0.001; % El error en este caso 10^{-3}
f = @(x) exp(x)-x.*sin(x); % función matematica
x = [a:0.01:b]; % Puntos para graficar en x
y = f(x); % Puntos de la imagen de los puntos de X

[ps_k,ks,as_k,bs_k,f_a,f_b,f_pks,p_k,f_pk]=localizacion_raiz(f,a,b,N,Tol); %Localización de raiz
Grafica_tabla(ps_k,ks,as_k,bs_k,f_a,f_b,f_pks,p_k,f_pk,x,y,false); %Mostrar la tabla y una grafica que muestra el punto c y f(c)

%% ----------------------------------------- Punto 5---------------------------------------------------
format long
a = 1; %minimo del intervalo
b = 4; % Maximo del intervalo
n = 2;
N = 30; % Número de iteraciones
Tol = 0.0001; % Tolerancia
f_c_imag = 2; % Se debe cumplir que la imagen de f(c)=2
f = @(x) log(x)- x.*cos(x);
x = [a:0.0001:b]; % Puntos para graficar en x
y = f(x); % Puntos de la imagen de los puntos de X

[ps_k,ks,as_k,bs_k,f_a,f_b,f_pks,p_k,f_pk] = bolzano_inter (f,a,b,n,N,Tol); % Teorema de bolzano con Localización de raices
Grafica_tabla(ps_k,ks,as_k,bs_k,f_a,f_b,f_pks,p_k,f_pk,x,y,true); %Mostrar la tabla y una grafica  que muestra el punto c y f(c) con animación


