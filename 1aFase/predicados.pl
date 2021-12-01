:- consult([transportes,clientes,clientes,encomendas,utils]).
:- dynamic checkState/3, checkTransport/4, checkValidade/4, max_on_snd/2, freqs/2, sumTuples/3, encomenda/5, estafeta/3, transporte/5, evolucao/1, involucao/1.

%============================================================================================
%                                       ADD/REMOVE

add_estafeta(IdE,Nome,L) :- evolucao(estafeta(IdE,Nome,L)).

rem_estafeta(IdE) :- involucao(estafeta(IdE,_,_)).

add_cliente(IdC,Nome,L) :- evolucao(cliente(IdC,Nome,L)).

rem_cliente(IdC) :- involucao(cliente(IdC,_,_)).

add_encomenda(IdEnc,(IdE,IdT,IdC),(Data,Prazo),(Peso,Volume,Valor,Estado),Concelho) :- evolucao(encomenda(IdEnc,(IdE,IdT,IdC),(Data,Prazo),(Peso,Volume,Valor,Estado),Concelho)).

rem_encomenda(IdEnc) :- involucao(encomenda(IdEnc,_,_,_,_)).

%============================================================================================
%                                       PREDICADOS

% predicado 1
ecotrans(Res) :- 
    transporte(IdBike, bicicleta, _, _, _),
    findall((Id, N)
        , (estafeta(Id, _, _)
            , findall(_, encomenda(_, (Id, IdBike, _), _, _, _), Es)
            , length(Es, N))
        , L),
    max_on_snd(L, (Res, _)).

% predicado 2
estcliente(IdCliente, Res) :-
    findall((IdEst,IdEnc), encomenda(IdEnc,(IdEst,_,IdCliente), _, _, _), Res).

% predicado 3
servEstaf(IdEst, Res) :- 
    findall(IdCliente, encomenda(_,(IdEst, _, IdCliente), _, _,_), Res).

% predicado 4
%encomenda(IdEncomenda, (IdEstafeta, idTransporte, idcliente), (Data, prazoEntrega), (Peso, Volume, Valor, Estado), concelho)
valordia(Data, TotalFatorado) :-
    findall(Valor, encomenda(_, (_,_,_), (Data, _), (_,_,Valor,_), _), Values),
    sum_list(Values, TotalFatorado).

% predicado 5
freqZona(Res):-
	findall((Concelho),encomenda(_,_,_,(_,_,_,entregue),Concelho),L),
	freqs(L,Res).

% predicado 6
classificacaoMedia( IdEst, Media ):-                                
        estafeta(IdEst, _, L),
        sumTuples(2,L, Sum ),                      
        length( L, Length ),
        (Length > 0 -> Media is div(Sum,Length) ; Media is 0).

% predicado 7
entregasTransporte(Di/Mi/Yi,Df/Mf/Yf,B,M,C):-
	findall((D/M/Y,IdTrans),encomenda(_,(_,IdTrans,_),(D/M/Y,_),(_,_,_,entregue),_),L),
	checkValidade(L,Di/Mi/Yi,Df/Mf/Yf,T),
	checkTransport(T,B,M,C).

%predicado 8
entregasEstafeta(Di/Mi/Yi,Df/Mf/Yf,Out):-
	findall((D/M/Y,IdEst),encomenda(_,(IdEst,_,_),(D/M/Y,_),(_,_,_,entregue),_),Estafetas),
	checkValidade(Estafetas,Di/Mi/Yi,Df/Mf/Yf,T),
	freqs(T,Out).

% predicado 9
estadoIntrevalo(Di/Mi/Yi,Df/Mf/Yf,E,N):-
	findall((D/M/Y,Estado),encomenda(_,_,(D/M/Y,_),(_,_,_,Estado),_),L),
	checkValidade(L,Di/Mi/Yi,Df/Mf/Yf,Estados),
	checkState(Estados,E,N).

% predicado 10
pesototal(IdEst, Data, Res) :-
    findall(Peso, encomenda(_,(IdEst,_,_),(Data,_),(Peso, _, _, _), _), Pesos),
    sum_list(Pesos, Res).

