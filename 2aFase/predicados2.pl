:- consult([transportes,clientes,estafetas,encomendas,arestas,auxiliares]).

%predicado 1:
circuito(Nodo,Paths):-



%predicado 2 acho eu
adjacentes(Nodo,Adjs) :- 
    findall(Adj,
           (aresta(Nodo,Adj,_);
           aresta(Adj,Nodo,_)),
           Adjs).

%predicado 3:


%predicado 4:


%predicado 5:


%predicado 6:
