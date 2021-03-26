mayor_que() :-  write('Numero 1: '), read(X), 
                write('Numero 2: '), read(Y),
                (
                    (
                        X >= Y ->
                        write('El numero mayor es: '),
                        write(X)
                    );
                    (
                        write('El numero mayor es: '),
                        write(Y)
                    )
                ).

espar() :-  write('Numero: '), read(X), X mod 2 =:= 0.

leer_duplica() :-   write('Numero: '), read(X),
                    Z is X*2,
                    write('El doble de tu numero es: '), write(Z).

posNeg() :-     write('Numero: '), read(X),
                (
                    (
                        X = 0 ->
                        write(X), write(' no es positivo ni negativo, es neutro')
                    );
                    (
                        X < 0 ->
                        write(X), write(' es negativo')
                    );
                    (
                        X > 0 ->
                        write(X), write(' es positivo')
                    )
                ).


%base_de_conocimientos

ganados(juan,7).
ganados(susana,6).
ganados(pedro,2).
ganados(rosa,5).

jugados(rosa,10).
jugados(juan,13).
jugados(pedro,3).
jugados(susana,7).

porcentaje() :-     write('Nombre del jugador: '), read(X),
                    ganados(X, Nganados), jugados(X, Njugados),
                    P is ((Nganados*100)/Njugados),
                    write('El porcentaje de victoria de '), write(X),
                    write(' del '), write(P), write('%.').

%base_de_conocimientos

fruta(manzana,roja).
fruta(pera,verde).
fruta(fresa,roja).
fruta(durazno,amarillo).
fruta(manzana,verde).

color_fruta():-write('Color: '),read(X),fruta(Y,X),write(Y).

%solo muestra manzana por que la sentencia solo se realiza una vez, pero mostrar todos los rojos habria que almacenarlos en una lista y darle el paramertro de la lista a write.