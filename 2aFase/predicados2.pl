:- consult([transportes,clientes,estafetas,encomendas,arestas,auxiliares]).

%predicado 2 acho eu
adjacentes(Nodo,Adjs) :- 
    findall(Adj,
           (aresta(Nodo,Adj,_);
           aresta(Adj,Nodo,_)),
           Adjs).