#!/usr/bin/env python3
import collections
import random
from collections import defaultdict
from networkx.generators.random_graphs import erdos_renyi_graph
import networkx as nx
import matplotlib.pyplot as plt
import os, sys

original_stdout = sys.stdout

def shell():
    os.system('python -m pip install networkx matplotlib scipy')

#mapping = {1:'771',2:'386',3:'20',4:'336',5:'494',6:'695',7:'761',8:'484',9:'468',10:'768',11:'447',12:'937',13:'870',14:'955',15:'883',16:'966',17:'316',18:'454',19:'145',20:'511',21:'866',22:'429',23:'932',24:'894',25:'564',26:'34',27:'322',28:'700',29:'542',30:'254',31:'645',32:'329',33:'100',34:'557',35:'388',36:'233',37:'51',38:'504',39:'99',40:'803',41:'493',42:'864',43:'108',44:'555',45:'232',46:'813',47:'735',48:'697',49:'810',50:'397',51:'455',52:'375',53:'575',54:'755',55:'285',56:'75',57:'152',58:'381',59:'614',60:'54',61:'942',62:'600',63:'653',64:'782',65:'646',66:'550',67:'802',68:'582',69:'954',70:'839',71:'822',72:'943',73:'190',74:'881',75:'195',76:'774',77:'660',78:'900',79:'216',80:'359',81:'219',82:'816',83:'222',84:'416',85:'441',86:'720',87:'847',88:'114',89:'430',90:'140',91:'910',92:'843',93:'36',94:'38',95:'335',96:'260',97:'168',98:'687',99:'876',100:'308',101:'519',102:'346',103:'288',104:'358',105:'27',106:'274',107:'579',108:'888',109:'953',110:'656',111:'132',112:'218',113:'492',114:'526',115:'778',116:'597',117:'868',118:'850',119:'845',120:'924',121:'819',122:'873',123:'43',124:'860',125:'886',126:'192',127:'295',128:'368',129:'498',130:'177',131:'473',132:'841',133:'982',134:'893',135:'731',136:'535',137:'228',138:'420',139:'702',140:'150',141:'922',142:'472',143:'516',144:'560',145:'202',146:'474',147:'134',148:'433',149:'2',150:'690',151:'153',152:'183',153:'500',154:'846',155:'366',156:'88',157:'537',158:'87',159:'616',160:'55',161:'169',162:'599',163:'584',164:'71',165:'301',166:'647',167:'809',168:'413',169:'823',170:'661',171:'259',172:'627',173:'539',174:'758',175:'133',176:'706',177:'981',178:'950',179:'278',180:'980',181:'408',182:'936',183:'544',184:'568',185:'211',186:'52',187:'311',188:'502',189:'379',190:'23',191:'262',192:'130',193:'35',194:'330',195:'806',196:'967',197:'405',198:'156',199:'890',200:'675',201:'453',202:'206',203:'411',204:'762',205:'315',206:'757',207:'865',208:'649',209:'960',210:'689',211:'226',212:'162',213:'601',214:'334',215:'45',216:'903',217:'230',218:'684',219:'929',220:'718',221:'793',222:'919',223:'438',224:'323',225:'835',226:'14',227:'94',228:'760',229:'172',230:'174',231:'300',232:'752',233:'141',234:'459',235:'925',236:'979',237:'623',238:'247',239:'598',240:'617',241:'928',242:'770',243:'667',244:'370',245:'790',246:'478',247:'361',248:'175',249:'372',250:'326',251:'154',252:'354',253:'499',254:'277',255:'299',256:'344',257:'712',258:'450',259:'630',260:'380',261:'546',262:'128',263:'547',264:'968',265:'209',266:'520',267:'733',268:'801',269:'491',270:'901',271:'320',272:'126',273:'552',274:'861',275:'382',276:'797',277:'348',278:'654',279:'965',280:'767',281:'180',282:'189',283:'531',284:'563',285:'401',286:'200',287:'685',288:'273',289:'573',290:'131',291:'713',292:'400',293:'220',294:'897',295:'290',296:'963',297:'449',298:'908',299:'913',300:'505',301:'369',302:'110',303:'238',304:'250',305:'142',306:'79',307:'101',308:'188',309:'427',310:'872',311:'856',312:'4',313:'792',314:'941',315:'19',316:'666',317:'740',318:'41',319:'723',320:'339',321:'562',322:'74',323:'338',324:'594',325:'111',326:'815',327:'709',328:'77',329:'116',330:'490',331:'466',332:'13',333:'708',334:'549',335:'394',336:'463',337:'371',338:'556',339:'783',340:'78',341:'261',342:'948',343:'462',344:'536',345:'889',346:'991',347:'135',348:'997',349:'651',350:'898',351:'984',352:'176',353:'137',354:'851',355:'467',356:'833',357:'297',358:'644',359:'22',360:'905',361:'480',362:'722',363:'72',364:'882',365:'199',366:'725',367:'818',368:'611',369:'643',370:'314',371:'824',372:'217',373:'624',374:'734',375:'791',376:'196',377:'517',378:'76',379:'541',380:'831',381:'686',382:'807',383:'949',384:'728',385:'622',386:'439',387:'951',388:'61',389:'24',390:'952',391:'681',392:'469',393:'795',394:'143',395:'503',396:'999',397:'892',398:'475',399:'378',400:'442',401:'365',402:'483',403:'588',404:'589',405:'902',406:'291',407:'586',408:'138',409:'91',410:'136',411:'264',412:'827',413:'838',414:'102',415:'47',416:'591',417:'350',418:'214',419:'992',420:'814',421:'880',422:'812',423:'716',424:'673',425:'112',426:'632',427:'785',428:'224',429:'73',430:'93',431:'581',432:'947',433:'270',434:'916',435:'741',436:'376',437:'159',438:'571',439:'283',440:'436',441:'891',442:'543',443:'652',444:'284',445:'663',446:'510',447:'387',448:'352',449:'825',450:'389',451:'592',452:'115',453:'201',454:'887',455:'235',456:'304',457:'534',458:'975',459:'465',460:'642',461:'166',462:'918',463:'606',464:'271',465:'939',466:'421',467:'840',468:'650',469:'628',470:'39',471:'5',472:'390',473:'513',474:'987',475:'384',476:'830',477:'165',478:'146',479:'672',480:'282',481:'977',482:'487',483:'565',484:'488',485:'485',486:'796',487:'367',488:'7',489:'148',490:'917',491:'726',492:'3',493:'268',494:'786',495:'930',496:'638',497:'118',498:'403',499:'144',500:'524',501:'341',502:'698',503:'255',504:'240',505:'986',506:'121',507:'548',508:'147',509:'958',510:'127',511:'719',512:'707',513:'451',514:'103',515:'978',516:'90',517:'272',518:'12',519:'242',520:'422',521:'223',522:'938',523:'243',524:'983',525:'446',526:'631',527:'263',528:'506',529:'710',530:'753',531:'234',532:'383',533:'460',534:'641',535:'1',536:'933',537:'464',538:'909',539:'328',540:'989',541:'95',542:'448',543:'665',544:'332',545:'302',546:'113',547:'754',548:'844',549:'28',550:'863',551:'907',552:'561',553:'360',554:'182',555:'68',556:'593',557:'817',558:'9',559:'688',560:'585',561:'225',562:'385',563:'98',564:'461',565:'659',566:'25',567:'353',568:'402',569:'184',570:'530',571:'765',572:'583',573:'306',574:'648',575:'60',576:'578',577:'26',578:'30',579:'44',580:'11',581:'253',582:'926',583:'16',584:'915',585:'489',586:'221',587:'669',588:'854',589:'155',590:'21',591:'186',592:'896',593:'509',594:'84',595:'558',596:'779',597:'694',598:'415',599:'325',600:'533',601:'683',602:'737',603:'67',604:'305',605:'777',606:'756',607:'476',608:'458',609:'976',610:'878',611:'914',612:'122',613:'704',614:'479',615:'637',616:'119',617:'577',618:'808',619:'699',620:'257',621:'875',622:'595',623:'435',624:'0',625:'317',626:'178',627:'736',628:'293',629:'396',630:'364',631:'310',632:'921',633:'245',634:'198',635:'944',636:'210',637:'256',638:'287',639:'969',640:'664',641:'410',642:'655',643:'149',644:'634',645:'92',646:'874',647:'495',648:'296',649:'885',650:'763',651:'940',652:'470',653:'970',654:'849',655:'746',656:'959',657:'161',658:'407',659:'532',660:'636',661:'820',662:'377',663:'107',664:'540',665:'423',666:'857',667:'828',668:'471',669:'962',670:'946',671:'811',672:'70',673:'658',674:'345',675:'425',676:'481',677:'780',678:'772',679:'246',680:'730',681:'923',682:'59',683:'964',684:'444',685:'65',686:'829',687:'31',688:'105',689:'751',690:'693',691:'187',692:'961',693:'393',694:'906',695:'570',696:'899',697:'237',698:'313',699:'124',700:'434',701:'957',702:'29',703:'303',704:'587',705:'603',706:'538',707:'62',708:'452',709:'680',710:'566',711:'307',712:'357',713:'858',714:'204',715:'241',716:'848',717:'266',718:'319',719:'236',720:'691',721:'512',722:'744',723:'426',724:'971',725:'269',726:'671',727:'618',728:'995',729:'50',730:'85',731:'567',732:'559',733:'514',734:'343',735:'748',736:'205',737:'545',738:'280',739:'529',740:'69',741:'374',742:'362',743:'972',744:'826',745:'123',746:'212',747:'157',748:'80',749:'677',750:'248',751:'279',752:'49',753:'798',754:'179',755:'821',756:'515',757:'569',758:'191',759:'990',760:'750',761:'404',762:'331',763:'63',764:'867',765:'349',766:'496',767:'596',768:'58',769:'621',770:'57',771:'794',772:'732',773:'525',774:'974',775:'576',776:'739',777:'670',778:'289',779:'340',780:'608',781:'197',782:'717',783:'428',784:'994',785:'572',786:'625',787:'507',788:'721',789:'160',790:'151',791:'727',792:'185',793:'97',794:'40',795:'327',796:'181',797:'787',798:'437',799:'920',800:'985',801:'973',802:'615',803:'477',804:'207',805:'33',806:'48',807:'193',808:'286',809:'363',810:'318',811:'674',812:'333',813:'639',814:'859',815:'996',816:'852',817:'86',818:'988',819:'239',820:'805',821:'738',822:'486',823:'804',824:'522',825:'355',826:'766',827:'406',828:'602',829:'163',830:'912',831:'482',832:'10',833:'657',834:'775',835:'799',836:'607',837:'747',838:'309',839:'877',840:'612',841:'249',842:'501',843:'993',844:'129',845:'418',846:'104',847:'457',848:'692',849:'935',850:'832',851:'431',852:'294',853:'662',854:'904',855:'414',856:'56',857:'553',858:'17',859:'610',860:'398',861:'934',862:'267',863:'399',864:'776',865:'347',866:'911',867:'42',868:'167',869:'626',870:'445',871:'703',872:'508',873:'679',874:'956',875:'194',876:'527',877:'171',878:'158',879:'258',880:'879',881:'590',882:'609',883:'292',884:'275',885:'834',886:'342',887:'409',888:'356',889:'66',890:'551',891:'711',892:'788',893:'417',894:'884',895:'836',896:'419',897:'373',898:'117',899:'518',900:'742',901:'497',902:'46',903:'853',904:'18',905:'53',906:'106',907:'574',908:'678',909:'998',910:'668',911:'251',912:'633',913:'265',914:'743',915:'120',916:'15',917:'523',918:'337',919:'203',920:'605',921:'252',922:'173',923:'37',924:'395',925:'231',926:'869',927:'213',928:'351',929:'321',930:'215',931:'440',932:'705',933:'855',934:'6',935:'82',936:'729',937:'749',938:'443',939:'871',940:'635',941:'945',942:'96',943:'528',944:'312',945:'81',946:'676',947:'604',948:'620',949:'412',950:'613',951:'83',952:'715',953:'773',954:'745',955:'554',956:'139',957:'64',958:'89',959:'800',960:'927',961:'580',962:'759',963:'629',964:'392',965:'456',966:'701',967:'109',968:'784',969:'724',970:'696',971:'769',972:'895',973:'276',974:'714',975:'931',976:'324',977:'837',978:'432',979:'391',980:'170',981:'781',982:'640',983:'8',984:'298',985:'682',986:'842',987:'862',988:'244',989:'208',990:'164',991:'227',992:'789'}

graph = defaultdict(list)
graphMine = []
nodesL = []
dic = defaultdict(list)

def visualize(self):
    G = nx.Graph()
    G.add_edges_from(self.edges())
    nx.draw_networkx(G)
    plt.show()

class Path:
    def __init__(self,Ni,Nf):
        self.source = Ni
        self.dest = Nf
        self.cost = random.randint(1,15)
    def write_path(self):
        return("aresta(" + str(self.source) + "," + str(self.dest) + ","+ str(self.cost) + "),")
    def printpath(self):
        print("aresta(" + str(self.source) + "," + str(self.dest) + ","+ str(self.cost) + ").")


def add(dic,key,value):
    dic[key].append(value)

class Node:
    def __init__(self,where,encomenda):
        self.code = where
        self.list = encomenda
    def addEnc(self,encomenda):
        self.list.append(encomenda)
    def get_where(self):
        return(str(self.code))
    def printnode(self):
        print("node(" + str(self.code) + "," + str(self.list) + ").")

def open_encomendas():
    with open('encomendas.pl') as infile:
        encomendas = []
        for i in infile:                            
            data = i.replace('(',',',1).replace('(', '').replace(')', '')
            content = data.split(",",1)
            enc = content[1].split(',')
            if (enc[0] == "idEncomenda"):
                continue
            encomendas.append([enc[0].replace(' ',''),enc[1].replace(' ',''),enc[2].replace(' ',''),enc[3].replace(' ',''),enc[4].replace(' ',''),enc[5].replace(' ',''),enc[6].replace(' ',''),enc[7].replace(' ',''),enc[8].replace(' ',''),enc[9].replace(' ',''),enc[10].replace(' ',''),enc[11].replace(' ','').strip(".\n")])
    return encomendas

def toNode(dic,nodes):
    for key in dic:
        nodesL.append(Node(key,dic[key]))

def freq(row):
    counter=collections.Counter(row)
    return counter

def grafo():
    n = 25
    #n = 992
    p = 0.1
    g = erdos_renyi_graph(n, p)
    with open('./estimativas.pl','w') as f:
        sys.stdout = f # Change the standard output to the file we created.        
        print("%estimativa(Nodo,Estimativa).")        
        for i in range(n+1):    
            print("estimativa("+str(i)+','+str(random.randint(20,100))+").")    
    sys.stdout = original_stdout # Reset the standard output to its original value
    return g

def nodes(dic,row):
    add(dic,row[11],int(row[0]))

def write_to_file(nodesL,graphMine):
    with open('nodos.pl', 'w') as f:
        sys.stdout = f # Change the standard output to the file we created.
        print("%nodo(Nodo,Encomendas).")
        for line in nodesL:
            line.printnode()
        sys.stdout = original_stdout # Reset the standard output to its original value
    with open('arestas.pl', 'w') as f:
        sys.stdout = f # Change the standard output to the file we created.
        print("\n%aresta(Src,Dest,Cost).")
        for line in graphMine:
            line.printpath()
        sys.stdout = original_stdout # Reset the standard output to its original value

def make_graph(nodesL,graphMine):
    a = "grafo(["
    for row in graphMine:
        a = a + row.write_path()
    a = a[:-1]
    a = a+ "])."
    return a
        
def write_grafo(s):
    with open('graph.pl', 'w') as f:
        sys.stdout = f # Change the standard output to the file we created.
        print("%grafo([Nodos],[aresta(Src,Dest,Cost)]).")
        print(s)
        sys.stdout = original_stdout

def save_files(nodesL,graphMine):
    write_to_file(nodesL,graphMine)
    write_grafo(make_graph(nodesL,graphMine))

def main():
    enc = open_encomendas()
    post = []
    for row in enc:
        post.append(row[11])
        nodes(dic,row)
    count = freq(post)
    toNode(dic,nodes)
    g = grafo()
    H = g
    #H = nx.relabel_nodes(g, mapping)

    for row in H.edges():
        graphMine.append(Path(row[0],row[1]))
    save_files(nodesL,graphMine)
    visualize(H)

if __name__ == "__main__":
    shell()
    main()
