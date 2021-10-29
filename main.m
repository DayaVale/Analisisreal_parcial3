%% ---------------------------------- Punto2 ------------------------------------------------------ 
%grafica de visualización de 2
clear all

n1 = [-5:5];
n2 = [-6:-1];
n3 = [1:6];
sz = size(n1);
sz1 = size(n2);
sz2 = size(n3);
x = n1.^2;
y = @(x)abs(x)./x;
unida = zeros([1 sz1(2)+sz2(2)]);
unida(1:sz1(2)) = y(n2);
unida(sz1(2)+1:sz1(2)+sz2(2)) = y(n3);
n_unida = zeros([1 sz1(2)+sz2(2)]);
n_unida(1:sz1(2)) = n2;
n_unida(sz1(2)+1:sz1(2)+sz2(2)) = n3;
h = zeros(sz)+1;

plot(n1,x,'-o')
hold on
scatter(n_unida,unida)
plot(n1,h,'*')
grid on
title('\textbf{Grafica visualizacion}', 'Interpreter', 'latex')
xlabel('\textbf{Valores }', 'Interpreter','latex')
ylabel('\textbf{F($X$)}', 'Interpreter','latex')
legend('$x^{2}$','$\frac{|x|}{x}$','h(x)', 'Interpreter','latex')


%% ---------------------------------- Punto 3 ------------------------------------------------------
% Grafica visualización del 3
clear all
n = [-100:100];
x = 1./(n);
y = sqrt(2)./n;
f1 = @ (x) x.^2;
f2 = @ (y) -y.^3;

plot(x,f1(x),'-o')
hold on
plot(y,f2(y),'-o')
grid on
title('\textbf{Grafica visualizacion}', 'Interpreter', 'latex')
xlabel('\textbf{Valores de la sucesion}', 'Interpreter','latex')
ylabel('\textbf{F($X_n$)}', 'Interpreter','latex')
legend('$X_n$','$Y_n$', 'Interpreter','latex')


%% ------------------------------ Punto 4 -------------------------------------------------------------
clear all
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
clear all
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

%Manera 1
[ps_k,ks,as_k,bs_k,f_a,f_b,f_pks,p_k,f_pk] = localizacion_raizk(f,a,b,N,Tol,n); % Teorema de bolzano con Localización de raices
Grafica_tabla(ps_k,ks,as_k,bs_k,f_a,f_b,f_pks,p_k,f_pk,x,y,true); %Mostrar la tabla y una grafica  que muestra el punto c y f(c) con animación


