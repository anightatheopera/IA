:- consult([transportes,clientes,estafetas,encomendas,arestas,nodos,estimativas,auxiliares,algoritmos]).
:- dynamic min_on_snd/2.

%predicado 1:
circuito(Node,Paths):-
	solveAll(Node,Paths).


%predicado 2 acho eu
adjacentes(Nodo,Adjs) :- 
    findall(Adj,
           (aresta(Nodo,Adj,_);
           aresta(Adj,Nodo,_)),
           Adjs).

%predicado 3:


%predicado 4:
maisEficiente(Dest,PesoEnc,TempoRest,(Veiculo,(Caminho,DistMin))) :-
    circuito(Dest,Caminhos),
    min_on_snd(Caminhos,(Caminho/DistMin)),
    calculaVelF(PesoEnc,(Veiculo,Vel)),
    VMin is DistMin/TempoRest,
    VMin=<Vel.


%predicado 5:
menorDist(NodoFinal, Res) :- 
    circuito(NodoFinal, X), 
    min_on_snd(X,Res).

%predicado 6:
