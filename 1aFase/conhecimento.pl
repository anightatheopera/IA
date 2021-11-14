

%estafeta(IdEstafeta, Nome, [Classificacao], [IdEncomenda] )
estafeta(1, 'Ana Fernandes', [2,4,3], [1,4]).


%cliente(IdCliente, Nome,  [IdEncomenda])
cliente(1, 'Fernando Mendes', [1,2,4]).


%encomenda(IdEncomenda, (IdEstafeta, idTransporte, idcliente), (Data, prazoEntrega), (Peso, Volume, Valor, Estado), concelho)
% estado : 1 - entregue
%          0 - pendente
%          -1 - cancelada

encomenda(1, (1, 2, 4), ('19/01/2021', 72), (16, 2, 25, 0), 'Braga').


%transporte(idTransporte,Nome, PesoMaximo, VelocidadeMedia, nivelEcologico)
transporte(1, 'bicicleta', 5, 10, 3).
transporte(2, 'mota', 20, 35, 2).
transporte(3, 'carro', 100, 25, 1).
