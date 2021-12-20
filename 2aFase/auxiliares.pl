:- consult([transportes,clientes,estafetas,encomendas,arestas]).

%coisas do predicado 4
bicicleta(Kgs,Vf) :- 
    Kgs<5,
    Vf is 10-(Kgs*0.7).
mota(Kgs,Vf) :-  
    Kgs<20,
    Vf is 35-(Kgs*0.5).
carro(Kgs,Vf) :-  Vf is 25-(Kgs*0.1).

atrasar(IdTrans,PesoEnc,Vf) :-
    transporte(IdTrans,bicicleta,_,_,_),
    bicicleta(PesoEnc,Vf).
atrasar(IdTrans,PesoEnc,Vf) :-
    transporte(IdTrans,mota,_,_,_),
    mota(PesoEnc,Vf).
atrasar(IdTrans,PesoEnc,Vf) :-
    transporte(IdTrans,carro,_,_,_),
    carro(PesoEnc,Vf).

maisEcologico(Peso,Vel,bicicleta) :-
    Vel=<10,
    Peso<5.
maisEcologico(Peso,Vel,mota) :- 
    Vel=<35,
    Vel>10, 
    Peso<20.
maisEcologico(Peso,Vel,carro) :-
    Vel=<25,
    Peso<100.

maisEficiente(Part,Cheg,PesoEnc,TempoRest,Veiculo) :-
    aresta(Part,Cheg,Perc),
    Min is Perc/TempoRest,
    maisEcologico(PesoEnc,Min,Veiculo).
%fim de coisas do predicado 4
