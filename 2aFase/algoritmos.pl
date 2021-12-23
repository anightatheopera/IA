:- consult([nodos,estimativas,arestas,graph]).
addDest(Node):-
	insercao(destino(Node)).

remDest(Node):-
	remocao(destino(Node)).

insercao(Termo) :- assertz(Termo).
insercao(Termo) :- retract(Termo),!,fail.

remocao(Termo) :- retract(Termo).
remocao(Termo) :- assertz(Termo),!,fail.

origem(0).

adjacent(X,Y,C):- aresta(X,Y,C).
adjacent(X,Y,C):- aresta(Y,X,C).

move_cyclefree(Visited, Node, NextNode, Cost) :-
	adjacent(Node, NextNode, Cost),
	\+ member(NextNode, Visited).

move([Node|Path]/Cost/_, [NextNode,Node|Path]/NewCost/Est) :-
	adjacent(Node, NextNode, StepCost),
	\+ member(NextNode, Path),
	NewCost is Cost + StepCost,
	estimativa(NextNode, Est).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Inefficient Search%

caminho(A,B,P,C):-caminho1(A,[B],P,C).
caminho1(A,[A|P1],[A|P1],0).
caminho1(A,[Y|P1],P,C):- adjacent(X,Y,C1), 
                       not(member(X,[Y|P1])), 
		       caminho1(A,[X,Y|P1],P,C2),
		       C is 0+C1+C2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%DepthFirst Search%

solve_depthfirst_cyclefree(Path,Cost) :-
	origem(Node),
	depthfirst_cyclefree([Node], Node, RevPath, Cost),
	reverse(RevPath, Path).

depthfirst_cyclefree(Visited, Node, Visited, 0) :-
	destino(Node).

depthfirst_cyclefree(Visited, Node, Path, Cost) :-
	move_cyclefree(Visited, Node, NextNode, C1),
	depthfirst_cyclefree([NextNode|Visited], NextNode, Path, C2),
	Cost is C1+C2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Iterative Deepening Search%

path(Node, Node, [Node],0).
path(FirstNode, LastNode, [LastNode|Path],Cost) :-
	path(FirstNode, PenultimateNode, Path, C2),
	move_cyclefree(Path, PenultimateNode, LastNode, C1),
	Cost is C1+C2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Astar Search%

solve_astar(Nodo,CaminhoDistancia/CustoDist) :-
	estimativa(Nodo,EstimaD),
	aStar([[Nodo]/0/EstimaD],InvCaminho/CustoDist/_),
	reverse(InvCaminho,CaminhoDistancia).

aStar(Caminhos,Caminho) :-
	getBest(Caminhos,Caminho),
	Caminho = [Nodo|_]/_/_,destino(Nodo).

aStar(Caminhos,SolucaoCaminho) :-
	getBest(Caminhos,MelhorCaminho),
	select(MelhorCaminho,Caminhos,OutrosCaminhos),
	expandAstar(MelhorCaminho,ExpCaminhos),
	append(OutrosCaminhos,ExpCaminhos,NovoCaminhos),
        aStar(NovoCaminhos,SolucaoCaminho).	

getBest([Caminho],Caminho) :- !.
getBest([Caminho1/Custo1/Est1,_/Custo2/Est2|Caminhos],MelhorCaminho) :-
	Custo1 + Est1 =< Custo2 + Est2,!,
	getBest([Caminho1/Custo1/Est1|Caminhos],MelhorCaminho). 
getBest([_|Caminhos],MelhorCaminho) :- 
	getBest(Caminhos,MelhorCaminho).


expandAstar(Path, ExpPaths) :-
	findall(NewPath, move(Path,NewPath), ExpPaths).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Greedy Search%

solve_greedy(Nodo,CaminhoDistancia/CustoDist) :-
	estimativa(Nodo,EstimaD),
	greedy([[Nodo]/0/EstimaD],InvCaminho/CustoDist/_),
	reverse(InvCaminho,CaminhoDistancia).

greedy(Caminhos,Caminho) :-
	getBestGreedy(Caminhos,Caminho),
	Caminho = [Nodo|_]/_/_,
	destino(Nodo).

greedy(Caminhos,SolucaoCaminho) :-
	getBestGreedy(Caminhos,MelhorCaminho),
	select(MelhorCaminho,Caminhos,OutrosCaminhos),
	expandGreedy(MelhorCaminho,ExpCaminhos),
	append(OutrosCaminhos,ExpCaminhos,NovoCaminhos),
        greedy(NovoCaminhos,SolucaoCaminho).	

getBestGreedy([Caminho],Caminho) :- !.
getBestGreedy([Caminho1/Custo1/Est1,_/_/Est2|Caminhos],MelhorCaminho) :-
	Est1 =< Est2,!,
	getBestGreedy([Caminho1/Custo1/Est1|Caminhos],MelhorCaminho). 
getBestGreedy([_|Caminhos],MelhorCaminho) :- 
	getBestGreedy(Caminhos,MelhorCaminho).
	

expandGreedy(Caminho,ExpCaminhos) :-
	findall(NovoCaminho,move(Caminho,NovoCaminho),ExpCaminhos).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%%Search Algorithms

%Inefficient Search%

% Argumentos
% Node -> Onde quero ir.
% Cam -> Caminho de 0 ate Node
% Cost -> Custo de 0 ate Node.
%
% Observacoes, Nao e possivel fazer findall porque entra em loop infinito pois a solucao e sempre a mesma.
solveInefeciente(Node,Cam,Cost):-addDest(Node),origem(G),caminho(G,Node,Cam,Cost),remDest(Node).

%Iterative Deepening Search%

% Argumentos
% Node -> Onde quero ir.
% Cam -> Caminho de 0 ate Node
% Cost -> Custo de 0 ate Node.
%
% Observacoes, Nao e possivel fazer findall porque entra em loop infinito pois a solucao e sempre a mesma.
solveIterativeDeepening(Node,Cam,Cost) :-
	addDest(Node),
	origem(O),
	path(O, Node, RevPath,Cost),
	reverse(RevPath, Cam),
	remDest(Node).

%DepthFirst Search%

% Argumentos
% Node -> Onde quero ir.
% L -> Lista de (Caminho,Custo) de 0 ate Node.
solveAllDepthFirst(Node,L):-
	addDest(Node),
	findall((Path,Cost),solve_depthfirst_cyclefree(Path,Cost),L),
	remDest(Node).

%Astar Search%

%Argumentos
%Node -> Onde quero ir.
%Cam -> Caminho/Custo de 0 ate Node.
solveAstar(Node,Cam):-
	addDest(Node),
	origem(NO),
	solve_astar(NO,Cam),
	remDest(Node).


%Greedy Search%

%Argumentos
%Node -> Onde quero ir.
%Cam -> Caminho/Custo de 0 ate Node.
solveGreedy(Node,Cam):-
	addDest(Node),
	origem(NO),
	solve_greedy(NO,Cam),
	remDest(Node).
