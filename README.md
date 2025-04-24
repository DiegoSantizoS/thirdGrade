# thirdGrade
# DIEGO FERNANDO SANTIZO SAMAYOA 0901-22-15950

Función newton_interp_3rd_degree(x_points, y_points, x, valor_real)
    Entrada:
        x_points: vector con los puntos x conocidos
        y_points: vector con los valores y = f(x) correspondientes
        x: punto en el que se quiere interpolar
        valor_real: valor verdadero de la función en x (para cálculo de error)

    Salida:
        y_interp: valor interpolado en x usando Newton
        error: error relativo porcentual

    Paso 1: Inicializar
        n ← número de elementos en x_points
        Crear matriz F[n][n] de ceros
        Copiar y_points en la primera columna de F

    Paso 2: Calcular diferencias divididas
        Para j desde 2 hasta n:
            Para i desde 1 hasta (n - j + 1):
                F[i][j] ← (F[i+1][j-1] - F[i][j-1]) / (x_points[i + j - 1] - x_points[i])

    Paso 3: Evaluar el polinomio de Newton en x
        y_interp ← F[1][1]
        producto ← 1

        Para k desde 2 hasta n:
            producto ← producto * (x - x_points[k - 1])
            y_interp ← y_interp + F[1][k] * producto

    Paso 4: Calcular error porcentual
        error ← valor absoluto de ((y_interp - valor_real) / valor_real) * 100

    Retornar y_interp, error
Fin Función
