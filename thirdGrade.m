clc; clear; close all; % borrar consola, variables y cerrar figuras

%{
Función: newton_interp_3rd_degree
Descripción: Realiza interpolación de Newton de tercer grado utilizando diferencias divididas.
Entradas:
- x_points: vector de puntos x conocidos
- y_points: vector de valores y correspondientes a x_points
- x: punto en el cual se desea interpolar
- valor_real: valor real de la función en x (para cálculo de error)
Salidas:
- y_interp: valor interpolado en x
- error: error porcentual relativo entre y_interp y valor_real
%}
function [y_interp, error] = newton_interp_3rd_degree(x_points, y_points, x, valor_real)
    % Número de puntos
    n = length(x_points);
    
    % Inicializar la tabla de diferencias divididas
    F = zeros(n, n);
    F(:,1) = y_points(:); % primera columna con los valores de y
    
    % Calcular las diferencias divididas
    for j = 2:n
        for i = 1:(n - j + 1)
            F(i,j) = (F(i+1,j-1) - F(i,j-1)) / (x_points(i+j-1) - x_points(i));
        end
    end
    
    % Evaluar el polinomio de interpolación en x
    y_interp = F(1,1); % término independiente
    producto = 1; % inicializar producto para términos sucesivos
    for k = 2:n
        producto = producto * (x - x_points(k-1));
        y_interp = y_interp + F(1,k) * producto;
    end
    
    % Calcular el error porcentual relativo
    error = abs((y_interp - valor_real) / valor_real) * 100;
end

% Datos de entrada
x_points = [1, 1.5, 2.5, 4]; % puntos x conocidos
y_points = [0, 0.405465, 0.916291, 1.386294]; % ln(x) evaluado en x_points
x = 2; % punto a interpolar
valor_real = log(2); % valor real de ln(2)

% Llamar a la función de interpolación
[y_est, error] = newton_interp_3rd_degree(x_points, y_points, x, valor_real);

% Mostrar resultados
fprintf('Estimación: ln(2) ≈ %.6f\n', y_est);
fprintf('Error porcentual relativo: %.2f%%\n', error);