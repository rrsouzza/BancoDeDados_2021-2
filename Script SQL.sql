drop table ite;
drop table pro;
drop table ped;
drop table cli;
drop table uf;
drop table ue;

CREATE TABLE UE 
(
  UE_COD varchar2(3) NOT NULL,
  UE_DESC varchar2(40) NOT NULL
);

CREATE TABLE UF 
(
  UF_COD varchar2(2) NOT NULL,
  UF_DESC varchar2(40) NOT NULL
);

CREATE TABLE PRO 
(
  PRO_COD INTEGER NOT NULL,
  UE_COD varchar2(3) NULL,
  PRO_NOME varchar2(40) NOT NULL,
  PRO_PRECO DECIMAL(8,2) NULL,
  PRO_QT DECIMAL(8,3) NULL
);

CREATE TABLE CLI 
(
  CLI_COD INT NOT NULL,
  UF_COD varchar2(2) NOT NULL,
  CLI_NOME varchar2(50) NOT NULL,
  CLI_RUA varchar2(40) NOT NULL,
  CLI_NUM INT NOT NULL,
  CLI_BAI varchar2(30) NOT NULL,
  CLI_CID varchar2(30) NOT NULL,
  CLI_CEP DECIMAL(11) NOT NULL,
  CLI_TEL DECIMAL(11) NOT NULL,
  CLI_PERC_DESC INT NULL
);

CREATE TABLE PED 
(
  PED_COD INTEGER NOT NULL,
  CLI_COD INT NOT NULL,
  PED_DT DATE NOT NULL,
  PED_VL_TOT DECIMAL(13,3) NOT NULL,
  PED_DESC DECIMAL(10,3) NULL,
  PED_VL_LIQ DECIMAL(13,3) NOT NULL,
  PED_DT_EMB DATE NOT NULL
);

CREATE TABLE ITE 
(
  PED_COD INTEGER NOT NULL,
  PRO_COD INTEGER NOT NULL,
  ITE_SEQ INT NOT NULL,
  ITE_VL_UNI DECIMAL(12,3) NOT NULL,
  ITE_VL_TOT DECIMAL(12,3) NOT NULL,
  ITE_QT DECIMAL(7,3) NOT NULL
 );

 ALTER TABLE UE
 ADD PRIMARY KEY (UE_COD);
 
 ALTER TABLE UF
 ADD PRIMARY KEY (UF_COD);
 
 ALTER TABLE PRO
 ADD PRIMARY KEY (PRO_COD);
 
 ALTER TABLE CLI
 ADD PRIMARY KEY (CLI_COD);
 
 ALTER TABLE PED
 ADD PRIMARY KEY (PED_COD);
 
 ALTER TABLE ITE
 ADD PRIMARY KEY (PED_COD, PRO_COD, ITE_SEQ);
 
 ALTER TABLE CLI
 ADD constraint f1 FOREIGN KEY(UF_COD)
   REFERENCES UF(UF_COD)
     ON DELETE CASCADE;
 
     
 ALTER TABLE PED
 ADD constraint f2 FOREIGN KEY(CLI_COD)
   REFERENCES CLI(CLI_COD);
      
 ALTER TABLE ITE
 ADD constraint f3 FOREIGN KEY(PRO_COD)
   REFERENCES PRO(PRO_COD);
     
 ALTER TABLE ITE
 ADD CONSTRAINT F4 FOREIGN KEY(PED_COD)
   REFERENCES PED(PED_COD);

 ALTER TABLE PRO
 ADD constraint f5 FOREIGN KEY(UE_COD)
  REFERENCES UE(UE_COD)
    ON DELETE CASCADE;

-- -----------------------------------
-- insere dado em unidades de estoque 
-- -----------------------------------

insert into ue values ('m','METRO');
insert into ue values ('V','VOLTS');
insert into ue values ('W','WATT');
insert into ue values ('ma','MILI AMPER');
insert into ue values ('mW','MILI WATT');
insert into ue values ('f','FARADAY');
insert into ue values ('mm2','MILIMETRO QUADRADO');
insert into ue values ('mm','MILIMETRO');
insert into ue values ('tn','TONELADA');
insert into ue values ('gr','GRAMA');
insert into ue values ('l','LITRO');
insert into ue values ('R','OHMS');
insert into ue values ('m2','METRO QUADRADO');
insert into ue values ('m3','METRO CÚBICO');
insert into ue values ('kv','KILO VOLTS');
insert into ue values ('nf','NANO FARADAY');
insert into ue values ('pf','PICO FARADAY');
insert into ue values ('a','AMPER');
insert into ue values ('ml','MILILITRO');
insert into ue values ('cm','CENT�METRO');
insert into ue values ('hz','HERTZ');
insert into ue values ('kg','KILOGRAMA');
insert into ue values ('%','PERCENTUAL');
insert into ue values ('tr','TONELADA DE REFRIGERAcAO');
insert into ue values ('hs','SHORE A');
insert into ue values ('cv','CAVALO VAPOR');
insert into ue values ('kw','KILO WATT');
insert into ue values ('mt','METRO');
insert into ue values ('um','UNIDADE');
insert into ue values ('mh','MILHEIRO');
insert into ue values ('cj','CONJUNTO');
insert into ue values ('fl','FOLHA');
insert into ue values ('bl','BLOCO');
insert into ue values ('jg','JOGO');
insert into ue values ('pr','PAR');
insert into ue values ('rl','ROLO');
insert into ue values ('db','DECIBEIS');
insert into ue values ('g','GRAMA');
insert into ue values ('oz','ONCA');
insert into ue values ('t','TONELADA');
insert into ue values ('mb','MEGA BYTES');
insert into ue values ('vg','VIAGEM');
insert into ue values ('lb','LIBRA');

-- -----------------------------------
-- insere dado em unidades federativas
-- -----------------------------------
 
insert into UF values ('ES','Espirito Santo');
insert into UF values ('RJ','Rio de Janeiro');
insert into UF values ('SP','Sao paulo');
insert into UF values ('MG','Minas Gerais');
insert into UF values ('RS','Rio Grande do Sul');
insert into UF values ('AM','Amazonas');
insert into UF values ('DF','Distrito Federal');
insert into UF values ('SC','Santa Catarina');
insert into UF values ('PA','Parana');
insert into UF values ('PR','Paraiba');
insert into UF values ('BA','Bahia');
insert into UF values ('SE','Sergipe');
insert into UF values ('AL','Alagoas');
insert into UF values ('CE','Ceara');
insert into UF values ('MA','Maranhao');
insert into UF values ('PI','Piaui');
insert into UF values ('RO','Rondonia');
insert into UF values ('RR','Roraima');
insert into UF values ('MS','Mato Grosso do Sul');
insert into UF values ('RN','Rio Grande do Norte');
insert into UF values ('TO','Tocantis');
insert into UF values ('GO','Goias');
insert into UF values ('AC','Acre');



-- -----------------------
-- insere dado em produtos
-- -----------------------

insert into pro values (1, 'kg','feijao', 1.00,10);
insert into pro values (2, 'kg','farinha de mandioca', 2.00,20);
insert into pro values (3, 'kg','arroz', 3.00,30);
insert into pro values (4, 'l','oleo de soja', 4.00,40);
insert into pro values (5, 'g','fuba', 5.00,50);
insert into pro values (6, 'kg','sal', 6.00,60);
insert into pro values (7, 'kg','manteiga', 7.00,70);
insert into pro values (8, 'g','pimenta', 8.00,80);
insert into pro values (9, 'kg','macarrao', 9.00,90);
insert into pro values (10, 'kg','maisena', 10.00,100);
insert into pro values (11, 'g','extrato de tomate', 11.00,110);
insert into pro values (12, 'rl','papel higienico', 12.00,120);
insert into pro values (13, 'um','sabonete', 13.00,130);
insert into pro values (14, 'um','creme dental', 14.00,140);
insert into pro values (15, 'l','amaciante', 15.00,150);
insert into pro values (16, 'kg','sabao em po', 16.00,160);
insert into pro values (17, 'l','agua sanitaria', 17.00,170);
insert into pro values (18, 'um','maionese', 18.00,180);
insert into pro values (19, 'l','iogurte', 19.00,190);
insert into pro values (20, 'g','maca', 20.00,200);
insert into pro values (21, 'kg','banana', 21.00,210);
insert into pro values (22, 'kg','pera', 22.00,220);
insert into pro values (23, 'kg','uva', 23.00,230);
insert into pro values (24, 'um','abacaxi', 24.00,240);
insert into pro values (25, 'kg','melancia', 25.00,250);
insert into pro values (26, 'kg','melao', 26.00,260);
insert into pro values (27, 'kg','pessego', 27.00,270);
insert into pro values (28, 'kg','nectarina', 28.00,280);
insert into pro values (29, 'um','biscoito', 29.00,290);
insert into pro values (30, 'rl','saco de lixo', 30.00,300);
insert into pro values (31, 'um','chiclete', 31.00,310);
insert into pro values (32, 'um','fosforo', 32.00,320);
insert into pro values (33, 'kg','alpiste', 33.00,330);
insert into pro values (34, 'um','lampada', 34.00,340);
insert into pro values (35, 'kg','materia_prima para pao caseiro', 35.00,350);
insert into pro values (36, 'mh','lajota', 36.00,360);
insert into pro values (37, 'm3','areia', 37.00,370);
insert into pro values (38, 'fl','folha de amianto cobertura seca', 38.00,380);
insert into pro values (39, 'oz','ouro amarelo liga cobre', 39.00,390);
insert into pro values (40, 'oz','ouro branco liga prata', 40.00,400);
insert into pro values (41, 'um','Leite Condensado', 41.00,410);
insert into pro values (100,null,'acucar mascavo', 100.00,1000);
insert into pro values (110,null,'pao-de-lo', 110.00,1100);
insert into pro values (120,null,'shampoo cabelos secos',null,null);
insert into pro values (130,null,'hidratante corporal',null,null);
insert into pro values (140,'kg','milho',null,null);
insert into pro values (150,'l','extrato de tomate',null,null);

-- -----------------------
-- insere dado em clientes
-- -----------------------

insert into cli values (1,'ES','Comercial PrecoBom Ltda', 'Rua das Araras',100,'Sossego','Vitoria',29000050,2733230101,10);
insert into cli values (2,'SP','O sacolao comercio varejista', 'Rua Ipe',5123,'Vila Mariana','Centro',11300000,1123220505,null);
insert into cli values (3,'ES','Comercio varejista Bom Pastor', 'Av XV de Novembro',1,'Praia da Costa','Vila Velha',29101330,2733399199,null);
insert into cli values (4,'RJ','Lojao do Preco Baixo', 'Rua Paulo VI',215,'Flamengo','Rio de Janeiro',21415000,2133220711,25);
insert into cli values (5,'BA','Industria de Derivados de Leite - Vacamocha', 'Rua Floriano Peixoto',415,'Pelourinho','Salvador',37526355,6175553255,5);
insert into cli values (6,'BA','Comercio de Farinaceos', 'Rua Senhor do Bonfim',2145,'Aleluia','Salvador',37520000,6136458000,15);
insert into cli values (7,'SP','MASPIX - Comercial Ltda', 'Av Fernao Dias',1,'Andorinhas','Taubate',11045000,1122991407,30);
insert into cli values (8,'SP','Mercado Vimer Me', 'Alameda Cosme Santos Pereira',1110,'Vila das Palmeiras','Centro',11850000,1139990512,12);
insert into cli values (9,'MG','Padaria e Confeitaria Pao Quentinho', 'Avenida Presidente Vargas',14,'Mangabeiras','Belo Horizonte',41000010,3132150455,null);
insert into cli values (10,'RJ','Centro de Comercio Varejista Carioca', 'Praca Goncalves Dias',2145,'Leblon','Rio de Janeiro',21350000,2123220780,3);
insert into cli values (11,'ES','Comercial e Industrial ComidaCaseira', 'Rua Antonio Fagundes de Moraes',22,'Vila Garrido','Cariacica',29360450,2732322152,null);
insert into cli values (12,'ES','Agosto Comercio Ltda', 'Rua das Palmeiras',250,'Praia Vermelha','Guarapari',29200050,2734241425,6);
insert into cli values (13,'RJ','Marcelo Martinense Industria e Comercio Ltda', 'Rua Francisco de Azevedo Alcuri',5,'Vila Palmares','Gavea',21215750,2134241755,10);
insert into cli values (14,'RS','Claudio Curi Comercial Ltda', 'Rua Adalberto Carlos Monet',2145,'Praia Formosa','Porto Alegre',50240010,4542458545,18);
insert into cli values (15,'RS','Familia Contigo e Irmaos Ltda', 'Praca Castro Alves',1440,'Morro da Vista','Cantao',50360520,4542856452,null);
insert into cli values (16,'PR','Comercio e Industria Vinicular Ltda', 'Avenida Comandante Lima Dutra',12,'Centro','Curitiba',40280000,4045121250,10);
insert into cli values (17,'SC','Vargas e Mendes Comercial Ltda', 'Rua Aracatuba Fraganca',2,'Boa Esperanca','Blumenau',32120650,4543236856,3);
insert into cli values (18,'SC','Varejo e Atacado comercial Ltda', 'Praca Olavo Setubal de Mendonca Filho',3,'Animados','Pomerode',32520660,4542126530,null);
insert into cli values (19,'PR','Vitoria Flores e Frutas Ltda', 'Alameda Tabajara',1,'Centro','Curibita',40280150,4045204250,null);
insert into cli values (20,'PR','Marcos Fernandes e Filhos Ltda', 'Alameda Tabajara',14,'Centro','Curibita',40280150,4042756589,null);
insert into cli values (21,'PR','Ana Pegova Miranda Comercial Ltda', 'Alameda Tabajara',214,'Centro','Curibita',40282000,4043628654,null);
insert into cli values (22,'ES','Filhos e Netos Comercio Ltda', 'Rua das Palmeiras',3300,'Praia Vermelha','Guarapari',29230000,2732543265,null);
insert into cli values (23,'RJ','Irmaos Braganca Comercial Ltda', 'Rua Francisco de Azevedo Alcuri',25,'Vila Palmares','Gavea',21200200,2134216523,10);
insert into cli values (24,'RS','Panificadora Vargas Ltda', 'Rua Adalberto Carlos Monet',2146,'Praia Formosa','Porto Alegre',50240010,4542483256,11);
insert into cli values (25,'BA','industria e Comercio Mercadante e Filhos Ltda', 'Rua Floriano Peixoto',435,'Pelourinho','Salvador',37526355,6175624523,2);
insert into cli values (26,'RJ','Preco Baixo Comercial Ltda', 'Rua Paulo VI',15,'Flamengo','Rio de Janeiro',21415000,2136585241,5);
insert into cli values (27,'SP','Carlos Batalha e Filhos Ltda', 'Av Fernao Dias',211,'Andorinhas','Taubate',11045150,1122154521,3);
insert into cli values (28,'BA','Laticinios Nova Esperanca Ltda', 'Rua Senhor do Bonfim',2120,'Aleluia','Salvador',37520000,6136585622,5);
insert into cli values (29,'SP','Marcado Master Me', 'Alameda Cosme Santos Pereira',1245,'Vila das Palmeiras','Centro',11850320,1132543256,null);
insert into cli values (30,'MG','Panificadora Irmaos Sa Ltda', 'Avenida Presidente Vargas',18,'Mangabeiras','Belo Horizonte',41000010,3133320452,2);
insert into cli values (31,'RJ','Industria e Comercio Irmaos Calvani Ltda', 'Praca Goncalves Dias',213,'Leblon','Rio de Janeiro',21350150,2122563254,1);
insert into cli values (32,'SP','Fernando Carvalho Comercial Ltda', 'Av Fernao Dias',450,'Andorinhas','Taubate',11045250,112254251,12);
insert into cli values (33,'RJ','Barateira Ltda', 'Rua Paulo VI',18,'Flamengo','Rio de Janeiro',21415000,2135521245,5);
insert into cli values (34,'BA','Laticinios Vida Longa Ltda', 'Rua Senhor do Bonfim',2125,'Aleluia','Salvador',37520000,6133256586,3);
insert into cli values (35,'BA','Escola de Primeiro Grau Francisco de Mendonca', 'Rua Senhor do Bonfim',212,'Aleluia','Salvador',37520350,6132896589,40);
insert into cli values (36,'BA','Escola Tecnica Federal da Bahia', 'Rua Castelo Branco',18,'Gloria','Salvador',37330300,6134523256,40);
insert into cli values (37,'RJ','Escola de 1 e 2 grau Presidente Dutra', 'Rua Paulo VI',215,'Flamengo','Rio de Janeiro',21415650,2132896523,45);
insert into cli values (38,'SP','Educandario Madre Tereza', 'Av Fernao Dias',21,'Andorinhas','Taubate',11045460,1123526589,40);
insert into cli values (39,'PR','Instituto de Educacao Fundamental Sales Gomes', 'Alameda Tabajara',2,'Centro','Curibita',40282150,4042126586,40);
insert into cli values (40,'ES','Centro de Ensino Fundamental Lima Barreto', 'Rua das Palmeiras',3352,'Praia Vermelha','Guarapari',29230650,2732006500,40);
-- --------------------------
-- carga da tabela de pedidos
-- --------------------------

insert into ped values (1, 1, TO_DATE('01/01/2007','MM/DD/YYYY'), 3500.00, 350.00, 3150.00, TO_DATE('01/01/2007','MM/DD/YYYY'));
insert into ped values (2, 1, TO_DATE('01/02/2007','MM/DD/YYYY'), 2500.00, 250.00, 2250.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (3, 1, TO_DATE('01/02/2007','MM/DD/YYYY'), 7500.00, 750.00, 6750.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (4, 1, TO_DATE('01/02/2007','MM/DD/YYYY'), 500.00, 50.00, 450.00, TO_DATE('01/02/2007','MM/DD/YYYY'));

insert into ped values (5, 2, TO_DATE('01/02/2007','MM/DD/YYYY'), 4500.00, 0, 4500.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (6, 2, TO_DATE('01/02/2007','MM/DD/YYYY'), 600.00, 0, 600.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (7, 2, TO_DATE('01/02/2007','MM/DD/YYYY'), 7500.00, 0, 7500.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (8, 2, TO_DATE('01/02/2007','MM/DD/YYYY'), 500.00, 0, 500.00, TO_DATE('01/02/2007','MM/DD/YYYY'));

insert into ped values (9, 3, TO_DATE('01/02/2007','MM/DD/YYYY'), 50.00, 0, 50.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (10, 3, TO_DATE('01/02/2007','MM/DD/YYYY'), 60.00, 0, 60.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (11, 3, TO_DATE('01/02/2007','MM/DD/YYYY'), 48.00, 0, 48.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (12, 3, TO_DATE('01/02/2007','MM/DD/YYYY'), 57.00, 0, 57.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (13, 3, TO_DATE('01/02/2007','MM/DD/YYYY'), 43.00, 0, 43.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (14, 3, TO_DATE('01/02/2007','MM/DD/YYYY'), 72.00, 0, 72.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (15, 3, TO_DATE('01/02/2007','MM/DD/YYYY'), 53.00, 0, 53.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (16, 3, TO_DATE('01/02/2007','MM/DD/YYYY'), 28.00, 0, 28.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (17, 3, TO_DATE('01/02/2007','MM/DD/YYYY'), 29.00, 0, 29.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (18, 3, TO_DATE('01/02/2007','MM/DD/YYYY'), 93.00, 0, 93.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (19, 3, TO_DATE('01/02/2007','MM/DD/YYYY'), 67.00, 0, 67.00, TO_DATE('01/02/2007','MM/DD/YYYY'));
insert into ped values (20, 3, TO_DATE('01/02/2007','MM/DD/YYYY'), 71.00, 0, 71.00, TO_DATE('01/02/2007','MM/DD/YYYY'));

insert into ped values (21, 4, TO_DATE('01/03/2007','MM/DD/YYYY'), 18000.00, 4500.00, 13500.00, TO_DATE('01/03/2007','MM/DD/YYYY'));
insert into ped values (22, 4, TO_DATE('01/03/2007','MM/DD/YYYY'), 6000.00, 1500.00, 4500.00, TO_DATE('01/03/2007','MM/DD/YYYY'));
insert into ped values (23, 4, TO_DATE('01/03/2007','MM/DD/YYYY'), 15200.00, 3800.00, 11400.00, TO_DATE('01/03/2007','MM/DD/YYYY'));
insert into ped values (24, 4, TO_DATE('01/03/2007','MM/DD/YYYY'), 20000.00, 5000.00, 15000.00, TO_DATE('01/03/2007','MM/DD/YYYY'));
insert into ped values (25, 4, TO_DATE('01/03/2007','MM/DD/YYYY'), 18000.00, 4500.00, 13500.00, TO_DATE('01/03/2007','MM/DD/YYYY'));
insert into ped values (26, 4, TO_DATE('01/03/2007','MM/DD/YYYY'), 3000.00, 750.00, 2250.00, TO_DATE('01/03/2007','MM/DD/YYYY'));
insert into ped values (27, 4, TO_DATE('01/03/2007','MM/DD/YYYY'), 15200.00, 3800.00, 11400.00, TO_DATE('01/03/2007','MM/DD/YYYY'));

insert into ped values (28, 5, TO_DATE('01/04/2007','MM/DD/YYYY'), 300.00, 15.00, 285.00, TO_DATE('01/04/2007','MM/DD/YYYY'));
insert into ped values (29, 5, TO_DATE('01/05/2007','MM/DD/YYYY'), 500.00, 25.00, 475.00, TO_DATE('01/05/2007','MM/DD/YYYY'));

insert into ped values (30, 6, TO_DATE('01/05/2007','MM/DD/YYYY'), 5000.00, 750.00, 4250.00, TO_DATE('01/05/2007','MM/DD/YYYY'));
insert into ped values (31, 6, TO_DATE('01/05/2007','MM/DD/YYYY'), 6000.00, 900.00, 5100.00, TO_DATE('01/05/2007','MM/DD/YYYY'));
insert into ped values (32, 6, TO_DATE('01/06/2007','MM/DD/YYYY'), 9000.00, 1350.00, 7650.00, TO_DATE('01/07/2007','MM/DD/YYYY'));
insert into ped values (33, 6, TO_DATE('01/07/2007','MM/DD/YYYY'), 6500.00, 975.00, 5525.00, TO_DATE('01/09/2007','MM/DD/YYYY'));

insert into ped values (34, 7, TO_DATE('01/08/2007','MM/DD/YYYY'), 18000.00, 5400.00, 12600.00, TO_DATE('01/08/2007','MM/DD/YYYY'));
insert into ped values (35, 7, TO_DATE('01/08/2007','MM/DD/YYYY'), 6000.00, 1800.00, 4200.00, TO_DATE('01/13/2007','MM/DD/YYYY'));
insert into ped values (36, 7, TO_DATE('01/09/2007','MM/DD/YYYY'), 12500.00, 3750.00, 8750.00, TO_DATE('01/13/2007','MM/DD/YYYY'));
insert into ped values (37, 7, TO_DATE('01/10/2007','MM/DD/YYYY'), 22540.00, 6762.00, 15778.00, TO_DATE('01/13/2007','MM/DD/YYYY'));
insert into ped values (38, 7, TO_DATE('01/11/2007','MM/DD/YYYY'), 19300.00, 5790.00, 13510.00, TO_DATE('01/13/2007','MM/DD/YYYY'));
insert into ped values (39, 7, TO_DATE('01/12/2007','MM/DD/YYYY'), 3000.00, 900.00, 2100.00, TO_DATE('01/13/2007','MM/DD/YYYY'));
insert into ped values (40, 7, TO_DATE('01/13/2007','MM/DD/YYYY'), 15200.00, 4560.00, 10640.00, TO_DATE('01/13/2007','MM/DD/YYYY'));

insert into ped values (41, 1, TO_DATE('01/13/2007','MM/DD/YYYY'), 7500.00, 750.00, 6750.00, TO_DATE('01/13/2007','MM/DD/YYYY'));
insert into ped values (42, 1, TO_DATE('01/13/2007','MM/DD/YYYY'), 500.00, 50.00, 450.00, TO_DATE('01/13/2007','MM/DD/YYYY'));

insert into ped values (43, 8, TO_DATE('01/13/2007','MM/DD/YYYY'), 10000.00, 1200.00, 8800.00, TO_DATE('01/13/2007','MM/DD/YYYY'));

insert into ped values (44, 10, TO_DATE('01/13/2007','MM/DD/YYYY'), 20.00, 0.60, 19.40, TO_DATE('01/13/2007','MM/DD/YYYY'));

insert into ped values (45, 12, TO_DATE('01/14/2007','MM/DD/YYYY'), 50.00, 3.00, 47.00, TO_DATE('01/14/2007','MM/DD/YYYY'));

insert into ped values (46, 13, TO_DATE('01/14/2007','MM/DD/YYYY'), 500.00, 50.00, 450.00, TO_DATE('01/14/2007','MM/DD/YYYY'));
insert into ped values (47, 13, TO_DATE('01/15/2007','MM/DD/YYYY'), 500.00, 50.00, 450.00, TO_DATE('01/15/2007','MM/DD/YYYY'));

insert into ped values (48, 14, TO_DATE('01/17/2007','MM/DD/YYYY'), 5800.00, 1044.00, 4756.00, TO_DATE('01/17/2007','MM/DD/YYYY'));
insert into ped values (49, 14, TO_DATE('01/17/2007','MM/DD/YYYY'), 5550.00, 990.00, 4510.00, TO_DATE('01/17/2007','MM/DD/YYYY'));

insert into ped values (50, 16, TO_DATE('01/18/2007','MM/DD/YYYY'), 2200.00, 220.00, 1980.00, TO_DATE('01/18/2007','MM/DD/YYYY'));
insert into ped values (51, 16, TO_DATE('01/19/2007','MM/DD/YYYY'), 2150.00, 215.00, 1935.00, TO_DATE('01/19/2007','MM/DD/YYYY'));

insert into ped values (52, 17, TO_DATE('01/19/2007','MM/DD/YYYY'), 20.00, 0.60, 19.40, TO_DATE('01/19/2007','MM/DD/YYYY'));

insert into ped values (53, 6, TO_DATE('01/19/2007','MM/DD/YYYY'), 6500.00, 975.00, 5525.00, TO_DATE('01/19/2007','MM/DD/YYYY'));

insert into ped values (54, 23, TO_DATE('01/19/2007','MM/DD/YYYY'), 2200.00, 220.00, 1980.00, TO_DATE('01/19/2007','MM/DD/YYYY'));
insert into ped values (55, 23, TO_DATE('01/19/2007','MM/DD/YYYY'), 2150.00, 215.00, 1935.00, TO_DATE('01/19/2007','MM/DD/YYYY'));
insert into ped values (56, 23, TO_DATE('01/20/2007','MM/DD/YYYY'), 4400.00, 440.00, 3960.00, TO_DATE('01/20/2007','MM/DD/YYYY'));
insert into ped values (57, 23, TO_DATE('01/21/2007','MM/DD/YYYY'), 4300.00, 430.00, 3870.00, TO_DATE('01/21/2007','MM/DD/YYYY'));

insert into ped values (58, 24, TO_DATE('01/22/2007','MM/DD/YYYY'), 2300.00, 253.00, 2047.00, TO_DATE('01/22/2007','MM/DD/YYYY'));
insert into ped values (59, 24, TO_DATE('01/23/2007','MM/DD/YYYY'), 1990.00, 218.90, 1771.10, TO_DATE('01/23/2007','MM/DD/YYYY'));
insert into ped values (60, 24, TO_DATE('01/24/2007','MM/DD/YYYY'), 3740.00, 411.40, 3328.60, TO_DATE('01/24/2007','MM/DD/YYYY'));
insert into ped values (61, 24, TO_DATE('01/25/2007','MM/DD/YYYY'), 4110.00, 452.10, 3657.90, TO_DATE('01/25/2007','MM/DD/YYYY'));
insert into ped values (62, 24, TO_DATE('01/26/2007','MM/DD/YYYY'), 4110.00, 452.10, 3657.90, TO_DATE('01/26/2007','MM/DD/YYYY'));

insert into ped values (63, 25, TO_DATE('01/27/2007','MM/DD/YYYY'), 15.00, 0.30, 14.70, TO_DATE('01/27/2007','MM/DD/YYYY'));

insert into ped values (64, 26, TO_DATE('01/28/2007','MM/DD/YYYY'), 300.00, 15.00, 285.00, TO_DATE('01/28/2007','MM/DD/YYYY'));
insert into ped values (65, 26, TO_DATE('01/28/2007','MM/DD/YYYY'), 500.00, 25.00, 475.00, TO_DATE('01/28/2007','MM/DD/YYYY'));

-- ------------------------
-- carga da tabela de itens
-- ------------------------
 
insert into ite values (1, 10, 1, 10.00, 1000.00, 100);
insert into ite values (1, 15, 2, 15.00, 2250.00, 150);
insert into ite values (1, 2, 3, 2.00, 250.00, 125);

insert into ite values (2, 25, 1, 25.00, 1250.00, 50);
insert into ite values (2, 20, 2, 20.00, 1000.00, 50);
insert into ite values (2, 21, 3, 21.00, 210.00, 10);
insert into ite values (2, 2, 4, 2.00, 40.00, 20);

insert into ite values (3, 35, 1, 35.00, 7000.00, 200);
insert into ite values (3, 100, 2, 100.00, 500.00, 5);

insert into ite values (4, 100, 1, 100.00, 500.00, 5);

insert into ite values (5, 1, 1, 1.00, 500.00, 500);
insert into ite values (5, 2, 2, 2.00, 500.00, 250);
insert into ite values (5, 3, 3, 3.00, 1500.00, 500);
insert into ite values (5, 4, 4, 4.00, 2000.00, 500);

insert into ite values (6, 16, 1, 16.00, 480.00, 30);
insert into ite values (6, 15, 2, 15.00, 120.00, 8);

insert into ite values (7, 9, 1, 9.00, 900.00, 100);
insert into ite values (7, 7, 2, 7.00, 700.00, 100);
insert into ite values (7, 11, 3, 11.00, 550.00, 50);
insert into ite values (7, 18, 4, 18.00, 900.00, 50);
insert into ite values (7, 4, 5, 4.00, 2000.00, 500);
insert into ite values (7, 19, 6, 19.00, 570.00, 30);
insert into ite values (7, 3, 7, 3.00, 1800.00, 600);
insert into ite values (7, 2, 8, 2.00, 80.00, 40);

insert into ite values (8, 15, 1, 15.00, 180.00, 12);
insert into ite values (8, 16, 2, 16.00, 320.00, 20);

insert into ite values (9, 1, 1, 1.00, 1.00, 1);
insert into ite values (9, 2, 2, 2.00, 2.00, 1);
insert into ite values (9, 3, 3, 3.00, 3.00, 1);
insert into ite values (9, 4, 4, 4.00, 4.00, 1);
insert into ite values (9, 5, 5, 5.00, 10.00, 2);
insert into ite values (9, 6, 6, 6.00, 6.00, 1);
insert into ite values (9, 7, 7, 7.00, 7.00, 1);
insert into ite values (9, 8, 8, 8.00, 8.00, 1);
insert into ite values (9, 9, 9, 9.00, 9.00, 1);

insert into ite values (10, 10, 1, 10.00, 10.00, 1);
insert into ite values (10, 11, 2, 11.00, 11.00, 1);
insert into ite values (10, 12, 3, 12.00, 12.00, 1);
insert into ite values (10, 13, 4, 13.00, 13.00, 1);
insert into ite values (10, 14, 5, 14.00, 14.00, 1);

insert into ite values (11, 15, 1, 15.00, 15.00, 1);
insert into ite values (11, 16, 2, 16.00, 16.00, 1);
insert into ite values (11, 17, 3, 17.00, 17.00, 1);

insert into ite values (12, 18, 1, 15.00, 18.00, 1);
insert into ite values (12, 19, 2, 19.00, 19.00, 1);
insert into ite values (12, 20, 3, 20.00, 20.00, 1);

insert into ite values (13, 21, 1, 21.00, 21.00, 1);
insert into ite values (13, 22, 2, 22.00, 22.00, 1);

insert into ite values (14, 23, 1, 23.00, 23.00, 1);
insert into ite values (14, 24, 2, 24.00, 24.00, 1);
insert into ite values (14, 25, 3, 25.00, 25.00, 1);

insert into ite values (15, 26, 1, 26.00, 26.00, 1);
insert into ite values (15, 27, 2, 27.00, 27.00, 1);

insert into ite values (16, 28, 1, 28.00, 28.00, 1);

insert into ite values (17, 29, 1, 29.00, 29.00, 1);

insert into ite values (18, 30, 1, 30.00, 30.00, 1);
insert into ite values (18, 31, 2, 31.00, 31.00, 1);
insert into ite values (18, 32, 3, 32.00, 32.00, 1);

insert into ite values (19, 33, 1, 30.00, 30.00, 1);
insert into ite values (19, 34, 2, 31.00, 31.00, 1);

insert into ite values (20, 35, 1, 35.00, 35.00, 1);
insert into ite values (20, 36, 2, 36.00, 36.00, 1);

insert into ite values (21, 100, 1, 100.00, 10000.00, 100);
insert into ite values (21, 110, 2, 110.00, 7700.00, 70);
insert into ite values (21, 41, 3, 41.00, 287.00, 7);
insert into ite values (21, 3, 4, 3.00, 3.00, 1);

insert into ite values (22, 10, 1, 10.00, 5000.00, 500);
insert into ite values (22, 100, 2, 100.00, 1000.00, 10);

insert into ite values (23, 2, 1, 2.00, 4000.00, 2000);
insert into ite values (23, 3, 2, 3.00, 6000.00, 2000);
insert into ite values (23, 5, 3, 5.00, 5000.00, 1000);
insert into ite values (23, 10, 4, 10.00, 200.00, 20);

insert into ite values (24, 7, 1, 7.00, 7000.00, 1000);
insert into ite values (24, 9, 2, 9.00, 18000.00, 2000);
insert into ite values (24, 5, 3, 5.00, 1000.00, 200);

insert into ite values (25, 11, 1, 11.00, 1100.00, 100);
insert into ite values (25, 9, 2, 9.00, 900.00, 100);
insert into ite values (25, 21, 3, 21.00, 2100.00, 100);
insert into ite values (25, 15, 4, 15.00, 4500.00, 300);
insert into ite values (25, 3, 5, 3.00, 3000.00, 1000);
insert into ite values (25, 8, 6, 8.00, 4000.00, 500);
insert into ite values (25, 16, 7, 16.00, 2400.00, 150);

insert into ite values (26, 100, 1, 100.00, 3000.00, 30);

insert into ite values (27, 2, 1, 2.00, 4000.00, 2000);
insert into ite values (27, 3, 2, 3.00, 6000.00, 2000);
insert into ite values (27, 5, 3, 5.00, 5000.00, 1000);
insert into ite values (27, 10, 4, 10.00, 200.00, 20);

insert into ite values (28, 1, 1, 1.00, 100.00, 100);
insert into ite values (28, 2, 2, 2.00, 200.00, 100);

insert into ite values (29, 5, 1, 5.00, 500.00, 100);

insert into ite values (30, 6, 1, 6.00, 3000.00, 500);
insert into ite values (30, 8, 2, 8.00, 400.00, 50);
insert into ite values (30, 4, 3, 4.00, 1600.00, 400);

insert into ite values (31, 12, 1, 12.00, 1200.00, 100);
insert into ite values (31, 14, 2, 14.00, 1400.00, 100);
insert into ite values (31, 20, 3, 20.00, 2000.00, 100);
insert into ite values (31, 9, 4, 9.00, 900.00, 100);
insert into ite values (31, 5, 5, 5.00, 500.00, 100);

insert into ite values (32, 30, 1, 30.00, 9000.00, 300);

insert into ite values (33, 15, 2, 15.00, 1500.00, 100);
insert into ite values (33, 5, 3, 5.00, 5000.00, 100);

insert into ite values (34, 11, 1, 11.00, 1100.00, 100);
insert into ite values (34, 9, 2, 9.00, 900.00, 100);
insert into ite values (34, 21, 3, 21.00, 2100.00, 100);
insert into ite values (34, 15, 4, 15.00, 4500.00, 300);
insert into ite values (34, 3, 5, 3.00, 3000.00, 1000);
insert into ite values (34, 8, 6, 8.00, 4000.00, 500);
insert into ite values (34, 16, 7, 16.00, 2400.00, 150);

insert into ite values (35, 11, 1, 11.00, 1100.00, 100);
insert into ite values (35, 9, 2, 9.00, 900.00, 100);
insert into ite values (35, 8, 3, 8.00, 4000.00, 500);

insert into ite values (36, 9, 1, 9.00, 900.00, 100);
insert into ite values (36, 21, 2, 21.00, 2100.00, 100);
insert into ite values (36, 15, 3, 15.00, 4500.00, 300);
insert into ite values (36, 3, 5, 4.00, 3000.00, 1000);
insert into ite values (36, 8, 6, 5.00, 2000.00, 250);

insert into ite values (37, 100, 1, 100.00, 10000.00, 100);
insert into ite values (37, 110, 2, 110.00, 7700.00, 70);
insert into ite values (37, 41, 3, 41.00, 287.00, 7);
insert into ite values (37, 3, 4, 3.00, 3000.00, 1000);
insert into ite values (37, 5, 5, 5.00, 1000.00, 200);
insert into ite values (37, 4, 6, 4.00, 404.00, 101);
insert into ite values (37, 27, 7, 27.00, 27.00, 1);
insert into ite values (37, 10, 8, 10.00, 10.00, 1);
insert into ite values (37, 16, 9, 16.00, 112.00, 7);

insert into ite values (38, 100, 1, 100.00, 5000.00, 50);
insert into ite values (38, 3, 2, 3.00, 3300.00, 1300);
insert into ite values (38, 5, 3, 5.00, 1000.00, 200);
insert into ite values (38, 4, 4, 4.00, 8000.00, 2000);
insert into ite values (38, 16, 5, 16.00, 2000.00, 125);

insert into ite values (39, 3, 1, 3.00, 3000.00, 1000);

insert into ite values (40, 2, 1, 2.00, 4000.00, 2000);
insert into ite values (40, 3, 2, 3.00, 6000.00, 2000);
insert into ite values (40, 5, 3, 5.00, 5000.00, 1000);
insert into ite values (40, 10, 4, 10.00, 200.00, 20);

insert into ite values (41, 2, 1, 2.00, 4000.00, 2000);
insert into ite values (41, 3, 2, 3.00, 3000.00, 1000);
insert into ite values (41, 5, 3, 5.00, 500.00, 100);

insert into ite values (42, 20, 1, 20.00, 500.00, 25);

insert into ite values (43, 3, 1, 3.00, 6000.00, 2000);
insert into ite values (43, 5, 2, 5.00, 4000.00, 800);

insert into ite values (44, 10, 3, 10.00, 20.00, 2);

insert into ite values (45, 2, 1, 2.00, 30.00, 15);
insert into ite values (45, 10, 2, 10.00, 20.00, 2);

insert into ite values (46, 2, 1, 2.00, 400.00, 200);
insert into ite values (46, 10, 2, 10.00, 100.00, 10);

insert into ite values (47, 2, 1, 2.00, 400.00, 200);
insert into ite values (47, 10, 2, 10.00, 100.00, 10);

insert into ite values (48, 10, 1, 10.00, 1000.00, 100);
insert into ite values (48, 11, 2, 11.00, 1100.00, 100);
insert into ite values (48, 12, 3, 12.00, 600.00, 50);
insert into ite values (48, 13, 4, 13.00, 1300.00, 100);
insert into ite values (48, 14, 5, 14.00, 1400.00, 100);
insert into ite values (48, 5, 6, 5.00, 400.00, 80);

insert into ite values (49, 10, 1, 10.00, 1000.00, 100);
insert into ite values (49, 11, 2, 11.00, 1100.00, 100);
insert into ite values (49, 12, 3, 12.00, 600.00, 50);
insert into ite values (49, 13, 4, 13.00, 1300.00, 100);
insert into ite values (49, 14, 5, 14.00, 1400.00, 100);
insert into ite values (49, 5, 6, 5.00, 150.00, 30);

insert into ite values (50, 22, 1, 22.00, 2200.00, 100);

insert into ite values (51, 21, 1, 21.00, 2100.00, 100);
insert into ite values (51, 10, 2, 10.00, 50.00, 5);

insert into ite values (52, 5, 1, 5.00, 20.00, 4);

insert into ite values (53, 100, 1, 100.00, 5000.00, 50);
insert into ite values (53, 5, 2, 5.00, 1000.00, 200);
insert into ite values (53, 10, 3, 10.00, 500.00, 50);

insert into ite values (54, 21, 1, 21.00, 2100.00, 100);
insert into ite values (54, 10, 2, 10.00, 100.00, 10);

insert into ite values (55, 11, 1, 11.00, 1100.00, 100);
insert into ite values (55, 9, 2, 9.00, 900.00, 100);
insert into ite values (55, 15, 3, 15.00, 150.00, 10);

insert into ite values (56, 22, 1, 22.00, 4400.00, 200);

insert into ite values (57, 23, 1, 23.00, 4140.00, 18);
insert into ite values (57, 16, 1, 16.00, 160.00, 10);

insert into ite values (58, 23, 1, 23.00, 2300.00, 100);

insert into ite values (59, 19, 1, 19.00, 1900.00, 100);
insert into ite values (59, 9, 2, 9.00, 90.00, 10);

insert into ite values (60, 3, 1, 3.00, 3000.00, 1000);
insert into ite values (60, 7, 2, 7.00, 700.00,100);
insert into ite values (60, 4, 3, 4.00, 40.00, 10);

insert into ite values (61, 4, 1, 4.00, 4000.00, 4000);
insert into ite values (61, 1, 2, 1.00, 100.00,100);
insert into ite values (61, 10, 3, 10.00, 10.00, 1);

insert into ite values (62, 4, 1, 4.00, 4000.00, 4000);
insert into ite values (62, 1, 2, 1.00, 100.00,100);
insert into ite values (62, 10, 3, 10.00, 10.00, 1);

insert into ite values (63, 15, 1, 15.00, 15.00, 1);

insert into ite values (64, 20, 1, 20.00, 300.00,15);

insert into ite values (65, 5, 1, 5.00, 500.00, 100);