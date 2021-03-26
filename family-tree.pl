es_hombre(leon).
es_hombre(juan).
es_hombre(antonioH).
es_hombre(jorge).
es_hombre(antonio).
es_hombre(victor).
es_hombre(antonioS).
es_hombre(arturoS).
es_hombre(erick).
es_hombre(issac).
es_hombre(leonardo).
es_hombre(aldo).
es_hombre(gerardo).
es_hombre(ramon).
es_hombre(arturo).
es_hombre(alberto).

es_mujer(guadalupeM).
es_mujer(maria).
es_mujer(mariaD).
es_mujer(mariaG).
es_mujer(gloria).
es_mujer(lourdes).
es_mujer(fabiola).
es_mujer(juana).
es_mujer(fabiola).
es_mujer(cintia).
es_mujer(nora).
es_mujer(violeta).
es_mujer(guadalupe).

%parent(X,Y) : X es padre o madre de Y
parent(antonio,leonardo).
parent(gloria,leonardo).
parent(antonio,aldo).
parent(gloria,aldo).
parent(mariaG,issac).
parent(jorge,issac).
parent(mariaG,nora).
parent(jorge,nora).
parent(mariaD,cintia).
parent(antonioH,cintia).
parent(mariaD,erick).
parent(antonioH,erick).
parent(victor,gerardo).
parent(fabiola,gerardo).
parent(victor,violeta).
parent(fabiola,violeta).
parent(lourdes,guadalupe).
parent(antonioS,guadalupe).
parent(lourdes,ramon).
parent(antonioS,ramon).
parent(juana,arturo).
parent(arturoS,arturo).
parent(juana,alberto).
parent(arturoS,alberto).
parent(leon,antonio).
parent(guadalupeM,antonio).
parent(leon,mariaD).
parent(guadalupeM,mariaD).
parent(leon,mariaG).
parent(guadalupeM,mariaG).
parent(juan,gloria).
parent(maria,gloria).
parent(juan,victor).
parent(maria,victor).
parent(juan,lourdes).
parent(maria,lourdes).
parent(juan,juana).
parent(maria,juana).

%es_hijo(X,Y) : X es hijo de Y
es_hijo(Hijo,Padre):- parent(Padre,Hijo), es_hombre(Hijo).
%es_hija(X,Y) : X es hija de Y
es_hija(Hija,Padre):- parent(Padre,Hija), es_mujer(Hija).

%es_madre(X,Y) : X es madre de Y
es_madre(Madre,Hijo):- parent(Madre,Hijo), es_mujer(Madre).
%es_padre(X,Y) : X es padre de Y
es_padre(Padre,Hijo):- parent(Padre,Hijo), es_hombre(Padre).

%DUDA
%casados(X,Y) : X tiene hijos en común con Y
casados(Padre1,Padre2):- es_padre(Padre1,Z), es_madre(Padre2,Z).
casados(Padre1,Padre2):- es_madre(Padre1,Z), es_padre(Padre2,Z).

%es_abuelo(X,Y) : X es abuelo de Y
es_abuelo(Abuelo,Nieto):- es_padre(Z,Nieto), es_padre(Abuelo,Z).
es_abuelo(Abuelo,Nieto):- es_madre(Z,Nieto), es_padre(Abuelo,Z).
%es_abuela(X,Y) : X es abuela de Y
es_abuela(Abuela,Nieto):- es_padre(Z,Nieto), es_madre(Abuela,Z).
es_abuela(Abuela,Nieto):- es_madre(Z,Nieto), es_madre(Abuela,Z).

%es_nieto(X,Y) : X es nieto de Y
es_nieto(Nieto,Abuelo):- es_hijo(Z,Abuelo), es_hijo(Nieto,Z).
es_nieto(Nieto,Abuelo):- es_hija(Z,Abuelo), es_hijo(Nieto,Z).
%es_nieta(X,Y) : X es nieta de Y
es_nieta(Nieta,Abuelo):- es_hijo(Z,Abuelo), es_hija(Nieta,Z).
es_nieta(Nieta,Abuelo):- es_hija(Z,Abuelo), es_hija(Nieta,Z).