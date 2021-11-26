:- op(900,xfy,'::').
:-style_check(-discontiguous).
:-style_check(-singleton).

% ------------- ESTAFETA -------------- --- -- -- - - - - 

% Não permitir a INSERÇÃO de conhecimento repetido pelo id 
+estafeta( IdE, _, _ ) :: (
                            solucoes( IdE, estafeta( IdE, _, _ ), R ),
                            comprimento( R, 1 )
                          ).

% Não permitir REMOVER um IDEstafeta já associado a uma encomenda
-estafeta( IdE, _, _ ) :: (
                            solucoes( IdE, encomenda( _, ( IdE, _, _ ), _, _, _), R ),
                            comprimento( R, 0 )                 
                          ).

% ------------- CLIENTE ---------------- --- -- -- - - - - 

% Não permitir a INSERÇÃO de conhecimento repetido pelo id 
+cliente( IdC, _, _ ) :: (
                            solucoes( IdC, cliente( IdC, _, _ ), R ),
                            comprimento( R, 1 )
                         ).

% Não permitir REMOVER um IDCliente já associado a uma encomenda
-cliente( IdE, _, _ ) :: (
                            solucoes( IdE, encomenda( _, ( _, _, IdC ), _, _, _), R ),
                            comprimento( R, 0 )                 
                         ).

% ------------- ENCOMENDA -------------- --- -- -- - - - - 

% Não permitir a INSERÇÃO de conhecimento repetido pelo id 
+encomenda( Id, _, _, _, _ ) :: (
                                    solucoes( ID, encomenda( ID, _, _, _, _ ), R ),
                                    comprimento( R, 1 )
                                ).

% ------------ TRANSPORTE -------------- --- -- -- - - - - 

% Não permitir a INSERÇÃO de conhecimento repetido pelo id 
+transporte( IdT, _, _, _, _, _ ) :: (
                                        solucoes( IdT, transporte( IdT, _, _, _, _, _ ), R ),
                                        comprimento( R, 1 )
                                     ).

% Não permite a INSERÇÃO de qualquer conhecimento
+transporte( _, _, _, _, _, _ ) :: (
                                    solucoes( _, transporte( _, _, _, _, _, _ ), R ),
                                    comprimento( R, 1 )
                                   ). 

% Não permite REMOÇÃO de qualquer conhecimento 
-transporte( _, _, _, _, _, _ ) :: (
                                    solucoes( _, transporte( _, _, _, _, _, _ ), R ),
                                    comprimento( R, 0 )
                                   ). 