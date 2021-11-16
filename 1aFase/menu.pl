:- consult([conhecimento,predicados,utils]).
:- dynamic doit/1.

%============================================================================================
%                                       MENU

menu :- repeat,
    write('                        '),nl,
    write('+----------------------------------------------------------------------------------------------------+'),nl,
    write('|  GREEN DISTRIBUTION                                                                                |'),nl,
    write('+----------------------------------------------------------------------------------------------------+'),nl,
    write('|                                                                                                    |'),nl,
    write('|  1-  Id estafeta que utilizou mais vezes transportes ecologicos                                    |'),nl,
    write('|                                                                                                    |'),nl,
    write('|  2-  Id que estafetas entregaram determinadas encomendas a um determinado Cliente                  |'),nl,
    write('|                                                                                                    |'),nl,
    write('|  3-  Id clientes servidos por um determinado estafeta                                              |'),nl,
    write('|                                                                                                    |'),nl,
    write('|  4-  Calcular o valor faturado num dia                                                             |'),nl,
    write('|                                                                                                    |'),nl,
    write('|  5-  Id zonas com mais volume de entregas                                                          |'),nl,
    write('|                                                                                                    |'),nl,
    write('|  6-  Calcular a classificacao media de satisfacao de Cliente de um determinado estafeta            |'),nl,
    write('|                                                                                                    |'),nl,
    write('|  7-  Id total de entregas pelos diferentes transportes, num dado intervalo de tempo                |'),nl,
    write('|                                                                                                    |'),nl,
    write('|  8-  Id total de entregas, num determinado intervalo de tempo                                      |'),nl,
    write('|                                                                                                    |'),nl,
    write('|  9-  Calcular numero de encomendas entregues e nao entregues, num determinado intervalo de tempo   |'),nl,
    write('|                                                                                                    |'),nl,
    write('|  10- Calcular peso total transportado por estafeta num determinado dia                             |'),nl,
    write('|                                                                                                    |'),nl,
    write('+----------------------------------------------------------------------------------------------------+'),nl,
    write('Enter your choise: '),nl,
    read(Choice), Choice>0, Choice=<10,
    doit(Choice), Choice=10, !.

doit(1) :-
    ecotrans(N),
    write('                        '),nl,
    write('Querry Result -> ID estafeta que utilizou Transportes Ecologicos:'), write(N),nl.

doit(2) :-
    write('                        '),nl,
    write('Insira um ID de Cliente:'),nl,
    read(Id), Id>0, Id=<3,
    estcliente(Id,N),
    write('                        '),nl,
    write('Querry Result -> Id Estafeta:'),write(N),nl.

doit(3) :-
    write('                        '),nl,
    write('Insira um ID de Estafeta:'),nl,
    read(Id), Id>0, Id=<3,
    servEstaf(Id,N),
    write('                        '),nl,
    write('Querry Result -> Id Clientes servidos pelo Estafeta:'),write(N),nl.
    
doit(6) :- 
    write('                        '),nl,
    write('Insira um ID de Estafeta:'),nl,
    read(Id), Id>0, Id=<3,
    classificacaoMedia(Id,N),nl,
    write('                        '),nl,
    write('Querry Result -> Classificacao media de satisfacao de Cliente:'),write(N),nl.

doit(7) :-
    write('                        '),nl,
    write('Insira a Dia Inicial:'),nl,
    read(Di), Di>0, Di=<31,
    write('                        '),nl,
    write('Insira a Dia Final:'),nl,
    read(Df), Df>0, Df=<31,
    write('                        '),nl,
    write('Insira a Mes Inicial:'),nl,
    read(Mi), Mi>0, Mi=<12,
    write('                        '),nl,
    write('Insira a Mes Final:'),nl,
    read(Mf), Mf>0, Mf=<12,
    write('                        '),nl,
    write('Insira a Ano Inicial:'),nl,
    read(Yi), Yi>0, Yi=<2022,
    write('                        '),nl,
    write('Insira a Ano Final:'),nl,
    read(Yf), Yf>0, Yf=<2022,
    entregasTransporte(Di/Mi/Yi,Df/Mf/Yf,B,M,C),
    write('                        '),nl,
    write('Querry Result -> Bicicleta:'),write(B),nl,
    write('                 Mota:'),write(M),nl,
    write('                 Carro:'),write(C),nl.

doit(9) :- 
    write('                        '),nl,
    write('Insira a Dia Inicial:'),nl,
    read(Di), Di>0, Di=<31,
    write('                        '),nl,
    write('Insira a Dia Final:'),nl,
    read(Df), Df>0, Df=<31,
    write('                        '),nl,
    write('Insira a Mes Inicial:'),nl,
    read(Mi), Mi>0, Mi=<12,
    write('                        '),nl,
    write('Insira a Mes Final:'),nl,
    read(Mf), Mf>0, Mf=<12,
    write('                        '),nl,
    write('Insira a Ano Inicial:'),nl,
    read(Yi), Yi>0, Yi=<2022,
    write('                        '),nl,
    write('Insira a Ano Final:'),nl,
    read(Yf), Yf>0, Yf=<2022,
    estadoIntrevalo(Di/Mi/Yi,Df/Mf/Yf,E,N),
    write('                        '),nl,
    write('Querry Result -> Entregues:'),write(E),nl,
    write('                 Nao Entregue:'),write(N),nl.

doit(10) :-
    write('                        '),nl,
    write('Insira um ID de Estafeta:'),nl,
    read(Id), Id>0, Id=<3,
    write('                        '),nl,
    write('Insira uma Data [Formato: DD/MM/YYYY]'),nl,
    read(Data), 
    write('                        '),nl,
    pesototal(Id, Data, N),
    write('Querry Result -> Peso Total:'),write(N),nl.

