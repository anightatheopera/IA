:- consult([conhecimento]).


% [(A, Number)] -> (A, Number)
max_on_snd([H], H).
max_on_snd([(A0,N0)|T], Res) :-
    max_on_snd(T, (A1,N1)),
    Max is max(N0, N1),
    (Max =:= N0 -> Res = (A0,N0); Res = (A1,N1)).

% [(tuples)] -> Sum(values in pos X)
sumTuples(_,[],0).
sumTuples(Pos,[Tuple|T],Sum) :-
        sumTuples(Pos,T,Sum1),
        arg(Pos,Tuple,Elem),
        Sum is Sum1 + Elem.

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
servEstaf(IdEst, Res) :- findall(IdCliente, encomenda(_,(IdEst, _, IdCliente), _, _,_), Res).

% predicado 4

% predicado 5

% predicado 6
classificacaoMedia( IdEst, Media ):-                                
        estafeta(IdEst, _, L),
        sumTuples(2,L, Sum ),                      
        length( L, Length ),
        (Length > 0 -> Media is div(Sum,Length) ; Media is 0).

% predicado 7

% predicado 8

% predicado 9

% predicado 10
pesototal(IdEst, Data, Res) :-
    findall(Peso, encomenda(_,(IdEst,_,_),(Data,_),(Peso, _, _, _), _), Pesos),
    sum_list(Pesos, Res).


