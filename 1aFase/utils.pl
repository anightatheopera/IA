:- consult([conhecimento]).

%============================================================================================
%                                       Auxiliar

% [(A, Number)] -> (A, Number)
max_on_snd([H], H).
max_on_snd([(A0,N0)|T], Res) :-
    max_on_snd(T, (A1,N1)),
    Max is max(N0, N1),
    (Max =:= N0 -> Res = (A0,N0); Res = (A1,N1)).

%[X]->[(X,n)]
freqs([],[]).
freqs(In,Out):-
    freqs(In,[],Out).

freqs([],Out,Out).
freqs([X|Xs],Table,Out):-
    \+ member((X,_),Table),
    freqs(Xs,[(X,1)|Table],Out).

freqs([X|Xs],Table,Out) :-
    selectchk((X,N),Table, Others),
    M is N + 1,
    freqs(Xs, [(X,M)| Others], Out).

% [(tuples)] -> Sum(values in pos X)
sumTuples(_,[],0).
sumTuples(Pos,[Tuple|T],Sum) :-
        sumTuples(Pos,T,Sum1),
        arg(Pos,Tuple,Elem),
        Sum is Sum1 + Elem.
%Concat
concat([],L2,L2). concat([Head|Tail],L2,[Head|L3]) :- concat(Tail,L2,L3).

% (D_inicial/Mi/Yi,D_final/Mf/Yf,[Sent],[NotSent],(D/M/Y,Estado)) -> [Lista]
checkValidade([],_,_,[]).
checkValidade([(D/M/Y,Estado)|T],Di/Mi/Yi,Df/Mf/Yf,Out):-
	checkValidade(T,Di/Mi/Yi,Df/Mf/Yf,Out1),
	(Y<2022, Y>1900, M<13, M>0,D<32, D>0->
		(((Yi<Y, Y<Yf, Mi=<M, M=<Mf);(Y==Yi, Mi=<M);(Y==Yf, M=<Mf);(Y==Yi, Mi==M, Di=<D);(Y==Yf, M==Mf, D=<Df))-> concat([Estado],Out1,Out);concat([],Out1,Out))).

% [Estados] -> XEntregues Y!Entregues
checkState([],0,0).
checkState([Estado|T],E,N):-
	checkState(T,E1,N1),
	(Estado = entregue-> (E is E1 + 1,N is N1); (E is E1, N is N1 + 1)).

% [Transporte] -> XEntregues YEntregues ZEntregues
checkTransport([],0,0,0).
checkTransport([IdTrans|T],B,M,C):-
	checkTransport(T,B1,M1,C1),
	(IdTrans = 1 -> B is B1 + 1,M is M1, C is C1;(IdTrans = 2 -> M is M1 + 1, B is B1, C is C1;C is C1 + 1, B is B1, M is M1)).

% Date tester
checkDate(Di/Mi/Yi,Df/Mf/Yf,D/M/Y) :-
	(Y<2022, Y>1900, M<13, M>0,D<32, D>0->
		(((Yi<Y, Y<Yf, Mi=<M, M=<Mf);(Y==Yi, Mi=<M);(Y==Yf, M=<Mf);(Y==Yi, Mi==M, Di=<D);(Y==Yf, M==Mf, D=<Df)))).

% lista de todas as encomendas de um determinado estafeta
findDeliveriesIDE(IdE,DateI,Data,DateF,NEncs) :-
	checkDate(DateI,DateF,Data),
	findall(Id, encomenda(Id,(IdE,_,_),(_,_),(_,_,_,entregue),_), List),
	sum_list(List, NEncs).


