:- consult([graph,transportes,clientes,estafetas,encomendas,arestas,nodos,estimativas,auxiliares,algoritmos,predicados2]).
:- dynamic doit/1.

%============================================================================================
%                                       MENU

menu :- repeat,
    write('                        '),nl,
    write('+----------------------------------------------------------------------------------------------------+'),nl,
    write('|  GREEN DISTRIBUTION                                                                                |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  1 | Gerar circuitos de entrega, caso existam, que cubram um determinado territorio                |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  2 | Representação de diversos pontos de entrega em forma de grafo                                 |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  3 | Identificar quais os circuitos com maior numero de entregas                                   |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  4 | Comparar circuitos de entrega tendo em conta os identificadores de produtividade              |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  5 | Escolher o circuito mais rapido, utilizando o criterio da distancia                           |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  6 | Escolher o circuito mais ecologico, utilizando o criterio de tempo                            |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  0 | Sair do programa                                                                              |'),nl,
    write('+----------------------------------------------------------------------------------------------------+'),nl,
    write('Escolha uma opção: '),nl,
    read(Choice),
    0=<Choice,
    Choice=<12,
    (Choice == 0 -> write('A sair do programa...'), nl, doit(Choice); doit(Choice)),
    sleep(2),
    Choice=0,
    !.

doit(1) :-
    write('                        '),nl,
    write('Insira o numero de um nodo:'),nl,
    read(R), R>0,
    write('                        '),nl,
    circuito(R,N),
    write('Circuitos Gerados: '),write(N),nl,
    !.

doit(2) :- 
    write('                        '),nl,
    write('Insira o numero de um nodo:'),nl,
    read(R), R>0,
    write('                        '),nl,
    adjacentes(R,N),
    write('Pontos de Entrega: '),write(N),nl,
    !.

doit(5) :- 
    write('                        '),nl,
    write('Insira o numero do nodo final:'),nl,
    read(R), R>0,
    write('                        '),nl,
    menorDist(R,X),
    write('Circuito mais rapido, utilizando o criterio de distancia: '),write(X),nl,
    !.

doit(0) :- 
    sleep(1),
    halt,
    !.