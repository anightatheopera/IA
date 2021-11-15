

%estafeta(IdEstafeta, Nome, [(IdEncomenda, Classificacao)])
estafeta(1, 'Ana Fernandes', [(1,2),(3,4),(4,3)]).
estafeta(2, 'Ramiro Silva', [(2,1),(5,2)]).
estafeta(3, 'João Vidal', [(0,4),(6,5),(7,4)]).


%cliente(IdCliente, Nome,  [IdEncomenda])
cliente(1, 'Fernando Mendes', [1,2,4]).
cliente(2, 'Mia Oslov', [0,3,6]).
cliente(3, 'Ermelinda Ribeiro',[5,7]).


%encomenda(IdEncomenda, (IdEstafeta, idTransporte, idcliente), (Data, prazoEntrega), (Peso, Volume, Valor, Estado), concelho)
% estado : 1 - entregue
%          0 - pendente
%          -1 - cancelada

encomenda(0, (3,2,2), (19/01/2021,72), (16,2,25,pendente),       'Braga').
encomenda(1, (1,3,1), (14/04/2019,41), (85.87,75,48,pendente),   'Tábua').
encomenda(2, (2,1,1), (10/08/2021,64), (4.13,85,509,entregue),   'São João da Madeira').
encomenda(3, (1,1,2), (23/11/2020,21), (3.0,3,147,entregue),     'Avis').
encomenda(4, (1,2,1), (27/07/2019,56), (19.25,32,355,entregue),  'Silves').
encomenda(5, (2,3,3), (08/05/2021,44), (39.88,33,612,cancelada), 'Marco de Canaveses').
encomenda(6, (3,3,2), (18/09/2020,21), (98.92,45,125,perdida),   'Sátão').
encomenda(7, (3,2,3), (26/04/2021,14), (14.14,48,342,cancelada), 'Torre de Moncorvo').


%transporte(idTransporte,Nome, PesoMaximo, VelocidadeMedia, nivelEcologico)
transporte(1, 'bicicleta', 5, 10, 3).
transporte(2, 'mota', 20, 35, 2).
transporte(3, 'carro', 100, 25, 1).
