

%estafeta(IdEstafeta, Nome, [Classificacao], [IdEncomenda] )
estafeta(1, 'Ana Fernandes', [2,4,3], [1,4]).


%cliente(IdCliente, Nome,  [IdEncomenda])
cliente(1, 'Fernando Mendes', [1,2,4]).

%encomenda(IdEncomenda, Data, Peso, Volume, IdEstafeta, Valor, idTransporte, idcliente, conselho, estado, prazoEntrega)
% estado : 1 - entregue
%          0 - pendente
%          -1 - cancelada

encomenda(1, '19/01/2021', 5, 200, 1, 40, 1, 1, 'Braga', 1, 72).


%transporte(idTransporte,Nome, PesoMaximo, VelocidadeMedia, nivelEcologico)
transporte(1, 'bicicleta', 5, 10, 3).
transporte(2, 'moto', 20, 35, 2).
transporte(3, 'carro', 100, 25, 1).

