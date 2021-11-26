:- op(900,xfy,'::').
:-style_check(-discontiguous).
:-style_check(-singleton).

% ------------- ESTAFETA -------------- --- -- -- - - - - 

% Não permitir a INSERÇÃO de conhecimento repetido pelo id 
+estafeta( IdE, _, _ ) :: (
                            solucoes( IdE, estafeta( IdE, _, _ ), R ),
                            comprimento( R, 1 )
                          ).


% ------------- CLIENTE ---------------- --- -- -- - - - - 

% Não permitir a INSERÇÃO de conhecimento repetido pelo id 
+cliente( IdC, _, _ ) :: (
                            solucoes( IdC, cliente( IdC, _, _ ), R ),
                            comprimento( R, 1 )
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
                                        solucoes( IdT, transporte( Id, _, _, _, _, _ ), R ),
                                        comprimento( R, 1 )
                                     ).
