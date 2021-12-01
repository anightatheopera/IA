:- consult([transportes,estafetas,clientes,encomendas,predicados,utils]).
:- consult([knowledge,predicados,utils]).
:- dynamic doit/1.

%============================================================================================
%                                       MENU

menu :- repeat,
    write('                        '),nl,
    write('+----------------------------------------------------------------------------------------------------+'),nl,
    write('|  GREEN DISTRIBUTION                                                                                |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  1 | Id do estafeta que utilizou mais vezes transportes ecologicos                                 |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  2 | Quais os estafetas entregaram determinadas encomendas a um determinado Cliente                |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  3 | Ids de clientes servidos por um determinado estafeta                                          |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  4 | Valor faturado num determinado dia                                                            |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  5 | Localidades com maior volume de entregas                                                      |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  6 | Classificação media de satisfação de um determinado estafeta                                  |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  7 | Número de entregas feitas pelos diferentes transportes, num determinado intervalo de tempo    |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  8 | Id total de entregas, num determinado intervalo de tempo                                      |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  9 | Calcular o número de encomendas entregues e não entregues, num determinado intervalo de tempo |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('| 10 | Peso total transportado por um estafeta num determinado dia                                   |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('| 11 | Dar print da base de conhecimentos com paginação                                              |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('| MÉTODOS DE REMOÇÃO E ADIÇÃO DE CONHECIMENTO                                                        |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('| 12 | Adicionar um Estafeta                                                                         |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('| 13 | Remover um Estafeta                                                                           |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('| 14 | Adicionar um Cliente                                                                          |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('| 15 | Remover um Cliente                                                                            |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('| 16 | Adicionar uma Encomenda                                                                       |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('| 17 | Remover uma Encomenda                                                                         |'),nl,
    write('+----+-----------------------------------------------------------------------------------------------+'),nl,
    write('|  0 | Sair do Menu                                                                                  |'),nl,
    write('+----------------------------------------------------------------------------------------------------+'),nl,
    write('Escolha uma opção: '),nl,
    read(Choice),
    0=<Choice,
    Choice=<17,
    (Choice == 0 -> write('A sair do programa...'),nl, doit(Choice);doit(Choice)),
    Choice = 0,
    !.

doit(1) :-
    ecotrans(N),
    write('                        '),nl,
    write('Resultado -> ID do estafeta que utilizou mais vezes transportes ecológicos: '), write(N),nl.

doit(2) :-
    write('                        '),nl,
    write('Insira um ID de Cliente:'),nl,
    read(Id), Id>0, Id=<500,
    estcliente(Id,N),
    write('                        '),nl,
    write('Resultado -> (ID estafeta, ID respetiva encomenda): '),write(N),nl.

doit(3) :-
    write('                        '),nl,
    write('Insira um ID de estafeta:'),nl,
    read(Id), Id>0, Id=<300,
    servEstaf(Id,N),
    write('                        '),nl,
    write('Resultado -> ID clientes servidos pelo estafeta: '),write(N),nl.

doit(4) :-
    write('                        '),nl,
    write('Insira uma data de um dia:'),nl,
    read(Data),
    valordia(Data,N),
    write('                        '),nl,
    write('Resultado -> Valor faturado na dia inserido: '),write(N),nl.

doit(5) :-
    freqZona(Res),
    write('                        '),nl,
    write('Resultado -> (Localidade, Número de encomendas): '),write(Res),nl.

doit(6) :- 
    write('                        '),nl,
    write('Insira um ID de Estafeta:'),nl,
    read(Id), Id>0, Id=<300,
    classificacaoMedia(Id,N),nl,
    write('                        '),nl,
    write('Resultado -> Classificação de um estafeta: '),write(N),nl.

doit(7) :-
    write('                        '),nl,
    write('Insira a data inicial:'),nl,
    read(Di/Mi/Yi), Di>0, Di=<31, Mi>0, Mi=<12, Yi>0, Yi=<2022,
    write('                        '),nl,
    write('Insira a data final:'),nl,
    read(Df/Mf/Yf), Df>0, Df=<31, Mf>0, Mf=<12, Yf>0, Yf=<2022,
    entregasTransporte(Di/Mi/Yi,Df/Mf/Yf,B,M,C),
    write('                        '),nl,
    write('Resultado - Meio de transporte usado para as entregas entre datas'),nl,
    write('          -> Bicicleta: '),write(B),nl,
    write('          -> Mota     : '),write(M),nl,
    write('          -> Carro    : '),write(C),nl.

doit(8) :-
    write('                        '),nl,
    write('Insira a data inicial:'),nl,
    read(Di/Mi/Yi), Di>0, Di=<31, Mi>0, Mi=<12, Yi>0, Yi=<2022,
    write('                        '),nl,
    write('Insira a data final:'),nl,
    read(Df/Mf/Yf), Df>0, Df=<31, Mf>0, Mf=<12, Yf>0, Yf=<2022,
    entregasEstafeta(Di/Mi/Yi,Df/Mf/Yf,Out),
    write('                        '),nl,
    write('Resultado -> (ID estafeta, Número de entregas):'),write(Out),nl.

doit(9) :- 
    write('                        '),nl,
    write('Insira a data inicial:'),nl,
    read(Di/Mi/Yi), Di>0, Di=<31, Mi>0, Mi=<12, Yi>0, Yi=<2022,
    write('                        '),nl,
    write('Insira a data final:'),nl,
    read(Df/Mf/Yf), Df>0, Df=<31, Mf>0, Mf=<12, Yf>0, Yf=<2022,
    estadoIntrevalo(Di/Mi/Yi,Df/Mf/Yf,E,N),
    write('                        '),nl,
    write('Resultado -> Encomendas entregues    :'),write(E),nl,
    write('          -> Encomendas não entregues:'),write(N),nl.

doit(10) :-
    write('                        '),nl,
    write('Insira um ID de estafeta:'),nl,
    read(Id), Id>0, Id=<300,
    write('                        '),nl,
    write('Insira uma data'),nl,
    read(Data), 
    write('                        '),nl,
    pesototal(Id, Data, N),
    write('Resultado -> Peso total das encomendas:'),write(N),nl.

doit(11) :-
    write('                        '),nl,
	write("Não colocar pontos depois dos inputs"),nl,shell('python python.py').

doit(12) :-
    write('                        '),nl,
    write('Insira o ID do novo estafeta:'),nl,
    read(Id), Id>0,
    write('                        '),nl,
    write('Insira o Nome do novo estafeta:'),nl,
    write("(Formato: 'nome')"),nl,
    read(Name),
    write('                        '),nl,
    write('Insira uma lista de (IdEncomenda,Classificação):'),nl,
    write('(Formato: [(Id,Class),...])'),nl,
    read(X),
    add_estafeta(Id,Name,X),
    write('                        '),nl,
    write('Resultado -> Estafeta adicionado com sucesso').

doit(13) :-
    write('                        '),nl,
    write('Insira o ID do estafeta a eliminar:'),nl,
    read(Id), Id>0,
    rem_estafeta(Id),
    write('                        '),nl,
    write('Resultado -> Estafeta eliminado com sucesso'),nl.

doit(14) :-  
    write('                        '),nl,
    write('Insira o ID do novo cliente:'),nl,
    read(Id), Id>0,
    write('                        '),nl,
    write('Insira o Nome do novo cliente:'),nl,
    write("(Formato: 'nome')"),nl,
    read(Name),
    write('                        '),nl,
    write('Insira uma lista de IdEncomendas:'),nl,
    write('Formado: [Id1,...]'),nl,
    read(X),
    write('                        '),nl,
    add_cliente(Id,Name,X),
    write('Resultado -> Cliente Adicionado'),nl.

doit(15) :- 
    write('                        '),nl,
    write('Insira o ID do cliente a ser eliminado:'),nl,
    read(Id), Id>0,
    write('                        '),nl,
    rem_cliente(Id),
    write('Resultado -> Estafeta Eliminado'),nl.

doit(16) :- 
    write('                        '),nl,
    write('Insira o ID da nova encomenda:'),nl,
    read(Id), Id>0,
    write('                        '),nl,
    write('Insira um ID de estafeta:'),nl,
    read(IdE), Id>0,
    write('                        '),nl,
    write('Insira um ID de transporte:'),nl,
    read(IdT), Id>0,
    write('                        '),nl,
    write('Insira um ID de cliente:'),nl,
    read(IdC), Id>0,
    write('                        '),nl,
    write('Insira uma data:'),nl,
    read(Data), 
    write('                        '),nl,
    write('Insira um prazo:'),nl,
    write('Formato: DD/MM/YYY'),nl,
    read(Prazo), 
    write('                        '),nl,
    write('Insira o peso:'),nl,
    read(Peso), 
    write('                        '),nl,
    write('Insira o volume:'),nl,
    read(Volume), 
    write('                        '),nl,
    write('Insira o valor:'),nl,
    read(Valor), 
    write('                        '),nl,
    write('Insira o estado:'),nl,
    write('Formato: entregue | pendente | cancelada'),nl,
    read(Estado), 
    write('                        '),nl,
    write('Insira o concelho:'),nl,
    read(Concelho), 
    write('                        '),nl,    
    add_encomenda(Id,(IdE,IdT,IdC),(Data,Prazo),(Peso,Volume,Valor,Estado),Concelho),
    write('Resultado -> Encomenda Adicionada'),nl.

doit(17) :- 
    write('                        '),nl,
    write('Insira o ID da encomenda a ser eliminada:'),nl,
    read(Id), Id>0,
    write('                        '),nl,
    rem_encomenda(Id),
    write('Resultado -> Encomenda Eliminado'),nl. 

doit(0):-
	sleep(1),
	halt.
