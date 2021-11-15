:- consult([conhecimento]).


% predicado 3

servEstaf(IdEst, Res) :- findall(IdCliente, encomenda(_,(IdEst, _, IdCliente), _, _,_), Res).

% predicado 7
% identificar o número total de entregas pelos diferentes meios de transporte, num determinado intervalo de tempo;

totEnc(IdTrans,  Res) :- findall(entregue, encomenda(_,(_,IdTrans,_),_,(_,_,_,entregue),_), Encomendas).