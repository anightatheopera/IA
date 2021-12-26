:- consult([transportes,clientes,estafetas,encomendas,arestas]).
:- dynamic aresta/3.

%coisas do predicado 4
calculaVelF(Kgs,(bicicleta,Vf)) :-
    Kgs<5,
    Vf is 10-(Kgs*0.7).
calculaVelF(Kgs,(mota,Vf)) :- 
    Kgs<20,
    Vf is 35-(Kgs*0.5).
calculaVelF(Kgs,(carro,Vf)) :-
    Kgs<100,
    Vf is 25-(Kgs*0.1).

%maisEficiente([],_,_,_).
maisEficiente(Dest,PesoEnc,TempoRest,(Veiculo,(Caminho,DistMin))) :-
    circuito(Dest,Caminhos),
    min_on_snd(Caminhos,(Caminho,DistMin)),
    calculaVelF(PesoEnc,(Veiculo,Vel)),
    VMin is DistMin/TempoRest,
    VMin=<Vel.

min_on_snd([H], H).
min_on_snd([(A0,N0)|T], Res) :-
    min_on_snd(T, (A1,N1)),
    Min is min(N0, N1),
    (Min =:= N0 -> Res = (A0,N0); Res = (A1,N1)).
%fim de coisas do predicado 4

% inicio de coisas do predicado 5

getDist(Node, X) :- aresta(Node, X, _).

getDest(Node, Y) :- aresta(Node, _, Y).

somDist(Dist1, Dist2, Res) :- Res is Dist1 + Dist2.

distancia([_], 0).
distancia()

% inicio de coisas do predicado 5

%STUFF
escrever([]).
escrever([H|T]) :-
	write(H), write("\n"),
	escrever(T).

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).


appendToList([],L,L).
appendToList([H|T],L,[H|Z]):- appendToList(T,L,Z).
appendToListS([],L).
appendToListS(R,[R|L]).

inverteLista([],Z,Z).
inverteLista([H|T],Z,Acc) :- inverteLista(T,Z,[H|Acc]).


inverso(Xs, Ys):-
	inverso(Xs, [], Ys).

inverso([], Xs, Xs).
inverso([X|Xs],Ys, Zs):-
	inverso(Xs, [X|Ys], Zs).
