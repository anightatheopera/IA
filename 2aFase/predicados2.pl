:- consult([transportes,clientes,estafetas,encomendas,arestas,nodos,estimativas,auxiliares,algoritmos]).

%predicado 1:
circuito(Node,Paths):-
	solveAllDepthFirst(Node,Paths).


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
    min_on_snd(Caminhos,(Caminho,DistMin)),
    calculaVelF(PesoEnc,(Veiculo,Vel)),
    VMin is DistMin/TempoRest,
    VMin=<Vel.


%predicado 5:
menorDist(NodoInicial, NodoFinal, Res) :- 
    circuito(NodoFinal, Res), 
    menorPath(NodoInicial,NodoFinal,X).

%predicado 6:
