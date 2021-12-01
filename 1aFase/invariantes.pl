:- consult([transportes,estafetas,clientes,encomendas]).
:- op(900,xfy,'::').
:-style_check(-discontiguous).
:-style_check(-singleton).

% ------------- ESTAFETA -------------- --- -- -- - - - - 

% Não permitir a INSERÇÃO de conhecimento repetido pelo id 
+estafeta( IdE, _, _ ) :: (
                            solucoes( J, estafeta( IdE, J, _ ), R ),
                            comprimento( R, 1 )
                          ).

% Não permitir REMOVER um IDEstafeta já associado a uma encomenda
-estafeta( IdE, _, _ ) :: (
                            solucoes( J, encomenda( J, ( IdE, _, _ ), _, _, _), R ),
                            comprimento( R, 1 )                 
                          ).

% ------------- CLIENTE ---------------- --- -- -- - - - - 

% Não permitir a INSERÇÃO de conhecimento repetido pelo id 
+cliente( IdC, _, _ ) :: (
                            solucoes( J, cliente( IdC, J, _ ), R ),
                            comprimento( R, 1 )
                         ).

% Não permitir REMOVER um IDCliente já associado a uma encomenda
-cliente( IdE, _, _ ) :: (
                            solucoes( IdC, encomenda( IdC, ( _, _, IdE ), _, _, _), R ),
                            comprimento( R, 1 )                 
                         ).

% ------------- ENCOMENDA -------------- --- -- -- - - - - 

% Não permitir a INSERÇÃO de conhecimento repetido pelo id 
+encomenda( Id, _, _, _, _ ) :: (solucoes( IdR, encomenda( Id, _, _, _, IdR ), R ),
                                    comprimento( R, 1 )
                                ).

% Não permitir a REMOÇÃO de conhecimento repetido pelo id
-encomenda( Id, _, _, _, _ ) :: (
                                    solucoes( IdF, encomenda( Id, _, _, _, F ), R ),
                                    comprimento( R, 1 )
                                ). 
