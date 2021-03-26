%menu
entrada(paella).
entrada(gazpacho).
entrada(consome).
carne(filete_de_cerdo).
carne(pollo_asado).
pescado(trucha).
pescado(bacalao).
postre(flan).
postre(nueces_con_miel).
postre(naranja).

%bebidas
bebida(vino).
bebida(cerveza).
bebida(agua_mineral).


%valor calorico de una racion
calorias(paella, 200).
calorias(gazpacho, 150).
calorias(consome, 300).
calorias(filete_de_cerdo, 400).
calorias(pollo_asado, 280).
calorias(trucha, 160).
calorias(bacalao, 300).
calorias(flan, 200).
calorias(nueces_con_miel, 500).
calorias(naranja, 50).

%valorcalorico_bebidas
calorias(vino, 140).
calorias(cerveza,300).
calorias(agua_mineral, 0).


%****************Reglas*******************
%plato_principal(P) P es un plato principal si es carne
plato_principal(P):- carne(P).
plato_principal(P):- pescado(P).

comida_completa(Entrada, Principal, Postre):- entrada(Entrada),plato_principal(Principal), postre(Postre).
%comida_completa_con_bebida
comida_completa(Entrada, Principal, Postre, Bebida):- entrada(Entrada),plato_principal(Principal), postre(Postre), bebida(Bebida).

%valorcalorico_comida donde el valor será la suma de calorías de los tres platos que componen la comida completa.
valorcalorico_comida(E,Pr,Po,V) :- comida_completa(E,Pr,Po), calorias(E,VE), calorias(Pr,VPR), calorias(Po,VPO), (V is (VE+VPR+VPO)).
%valorcalorico_comida_con_bebida
valorcalorico_comida(E,Pr,Po,B,V) :- comida_completa(E,Pr,Po,B), calorias(E,VE), calorias(Pr,VPR), calorias(Po,VPO), calorias(B,VB), (V is (VE+VPR+VPO+VB)).

%comida_equilibrada donde sera equilibrada si la suma calorica es menor o igual a 800 calorías.
comida_equilibrada(E,Pr,Po) :- comida_completa(E,Pr,Po), calorias(E,VE), calorias(Pr,VPR), calorias(Po,VPO), ((VE+VPR+VPO) =< 800).
%comida_equilibrada_con_bebida
comida_equilibrada(E,Pr,Po,B) :- comida_completa(E,Pr,Po,B), calorias(E,VE), calorias(Pr,VPR), calorias(Po,VPO), calorias(B,VB), ((VE+VPR+VPO+VB) =< 800).
