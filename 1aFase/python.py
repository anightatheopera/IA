#!/usr/bin/env python3
with open('knowledge.pl') as infile:
    encomendas = []
    estafetas = []
    clientes = []
    transportes = []
    for i in infile:
        data = i.replace('(',',',1).replace('(', '').replace(')', '')
        content = data.split(",",1)
        if(content[0] == "encomenda"):
            enc = content[1].split(',')
            encomendas.append([enc[0].replace(' ',''),enc[1].replace(' ',''),enc[2].replace(' ',''),enc[3].replace(' ',''),enc[4].replace(' ',''),enc[5].replace(' ',''),enc[6].replace(' ',''),enc[7].replace(' ',''),enc[8].replace(' ',''),enc[9].replace(' ',''),enc[10].strip(".\n")])
        elif(content[0] == "cliente"):
            cli = content[1].split(',',2)
            clientes.append([cli[0].replace(' ',''),cli[1],cli[2].replace(' ','').strip("\n")])
        elif(content[0] == "estafeta"):
            est = content[1].split(',',2)
            estafetas.append([est[0].replace(' ',''),est[1],est[2].replace(' ','').strip("\n")])
        elif(content[0] == "transporte"):
            tra = content[1].split(',')
            transportes.append([tra[0].replace(' ',''),tra[1].replace(' ',''),tra[2].replace(' ',''),tra[3].replace(' ',''),tra[4].replace(' ','').strip("\n")])

encomendas_grouped = [encomendas[25*i:(25*i)+25] for i in range(201)]
estafetas_grouped = [estafetas[10*i:(10*i)+10] for i in range(31)]
clientes_grouped = [clientes[10*i:(10*i)+10] for i in range(51)]

x = 0
a = 1

z = input("Qual a tabela de conhecimento que pretende imprimir (clientes,estafetas,encomendas,transportes)\n > ")
while z != "exit":
    if z == "encomendas":
        while x < 201:
            page = encomendas_grouped[x]
            print("-------------------------------------------------------- Encomendas --------------------------------------------------------")
            for row in page:
                print("+---------------------------------------------------------------------------------------------------------------------------")
                print("|   encomenda("+row[0]+",("+row[1]+','+row[2]+','+row[3]+"),("+row[4]+','+row[5]+"),("+row[6]+','+row[7]+','+row[8]+','+row[9]+"),"+row[10]+").")
            print("+---------------------------------------------------------------------------------------------------------------------------")
            a = input("Página {} de 200   \n Ir para > ".format(x+1))
            x = int(a)-1
    elif z == "estafetas":
        while x < 31:
            page = estafetas_grouped[x]
            print("-------------------------------------------------------- Estafetas ---------------------------------------------------------")
            for row in page:
                print("+---------------------------------------------------------------------------------------------------------------------------")
                print("|   estafeta("+row[0]+','+row[1]+','+row[2]+").")
            print("+---------------------------------------------------------------------------------------------------------------------------")
            a = input("Página {} de 30   \n Ir para > ".format(x+1))
            x = int(a)-1
    elif z == "clientes":
        while x < 51:
            page = clientes_grouped[x]
            print("-------------------------------------------------------- Clientes ---------------------------------------------------------")
            for row in page:
                print("+---------------------------------------------------------------------------------------------------------------------------")
                print("|   cliente("+row[0]+','+row[1]+','+row[2]+").")
            print("+---------------------------------------------------------------------------------------------------------------------------")
            a = input("Página {} de 50   \n Ir para > ".format(x+1))
            x = int(a)-1
    elif z == "transportes":
        print("------------------------------------------------------- Transportes --------------------------------------------------------")
        for row in transportes:
            print("+---------------------------------------------------------------------------------------------------------------------------")
            print("|   transporte("+row[0]+','+row[1]+','+row[2]+','+row[3]+','+row[4]+").")
        print("+---------------------------------------------------------------------------------------------------------------------------")

    print("Para sair escreva exit")
    z = input("Qual a tabela de conhecimento que pretende imprimir (clientes,estafetas,encomendas,transportes)\n > ")