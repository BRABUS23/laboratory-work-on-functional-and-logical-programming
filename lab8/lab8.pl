%Nomer 1
%Zadanie1

beret:- see('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/dan.txt').

read_spisstrok(Spis):- read_stroka(A,_,Toch),read_spisstrok([A],Spis,Toch).
read_spisstrok(Spis,Spis,1):- !.
read_spisstrok(Spis1,Spis,0):- read_stroka(A,_,Toch),append(Spis1,[A],B),
               read_spisstrok(B,Spis,Toch).

read_stroka(A,N,Toch):- get0(X),stroka(X,A,[],N,0,Toch).
stroka(-1,A,A,N,N,1):- !.
stroka(10,A,A,N,N,0):- !.
stroka(X,A,B,N,Kol,Toch):- Kol1 is Kol+1,append(B,[X],B1),get0(X1),
       stroka(X1,A,B1,N,Kol1,Toch).

max_stroka([],Max,Max):- !.
max_stroka([H|T],MMax,Max):-kol_elem(H,Kol),(Kol>MMax->MMax1 is Kol;
           MMax1 is MMax),max_stroka(T,MMax1,Max).
max_stroka(Spis,Max):- max_stroka(Spis,0,Max).

kol_elem([],Kol,Kol):- !.
kol_elem([_|T],KKol,Kol):-KKol1 is KKol+1,kol_elem(T,KKol1,Kol).
kol_elem(Spis,Kol):- kol_elem(Spis,0,Kol).

n1z1:- beret,read_spisstrok(Spis),max_stroka(Spis,Max),
        seen,write("Max stroka: "),write(Max).

%Zadanie 2

kol_strok_noprobel([],Kol,Kol):- !.
kol_strok_noprobel([H|T],KKol,Kol):- ((kol_probel(H,0,K),K=0)->KKol1 is KKol+1;
                 KKol1 is KKol),kol_strok_noprobel(T,KKol1,Kol).

kol_probel([],Kol,Kol):- !.
kol_probel([H|T],KKol,Kol):- (H=32->KKol1 is KKol+1;KKol1 is KKol),
           kol_probel(T,KKol1,Kol).

n1z2:- beret,read_spisstrok(Spis),kol_strok_noprobel(Spis,0,Kol),
       seen,write("Kol strok no probel: "), write(Kol).

%Zadanie 3

ch_spisok([],Spis,Spis):- !.
ch_spisok([H|T],SSpis,Spis):-append(SSpis,H,SSpis1),ch_spisok(T,SSpis1,Spis).
ch_spisok(SpisStr,Spis):- ch_spisok(SpisStr,[],Spis).

opred_stroka([],_,Kol,Kol):- !.
opred_stroka([H|T],Opr,KKol,Kol):- (H=Opr->KKol1 is KKol+1;KKol1 is KKol),
             opred_stroka(T,Opr,KKol1,Kol).
opred_stroka(Spis,Opr,Kol):- opred_stroka(Spis,Opr,0,Kol).
opred_stroka(Spis,Kol):- opred_stroka(Spis,65,Kol).

a_bolshe_stroka([], _,Spis,Spis):- !.
a_bolshe_stroka([H|T],Kol,SSpis,Spis):- opred_stroka(H,KKol),(KKol>Kol->
                append(SSpis,[H],SSpis1);SSpis1=SSpis),
                a_bolshe_stroka(T,Kol,SSpis1,Spis).
a_bolshe_stroka(SpisStr,Kol,Spis):- a_bolshe_stroka(SpisStr,Kol,[],Spis).

write_spisstrok([]):- !.
write_spisstrok([H|T]):- write_stroka(H),nl,write_spisstrok(T).

write_stroka([]):- !.
write_stroka([H|T]):- put(H),write_stroka(T).

n1z3:- beret,read_spisstrok(Str),ch_spisok(Str,Spis),opred_stroka(Spis,Opr),
       kol_elem(Str,KolStr),(KolStr\=0->Sred is Opr/KolStr;fail),
       a_bolshe_stroka(Str,Sred,Spis1),write_spisstrok(Spis1),seen.

%Zadanie 4

spisok_slov_ch([],SpisSlF,SpisSlF):- !.
spisok_slov_ch([H|T],SSpisSlF,SpisSlF):- spis_slov(H,SpisSl),
               append(SSpisSlF,SpisSl,SSpisSlF1),
               spisok_slov_ch(T,SSpisSlF1,SpisSlF).
spisok_slov_ch(Spis,SpisSlov):- spisok_slov_ch(Spis,[],SpisSlov).

spis_slov(Spis,SpisSl,SpisSl) :- no1probel(Spis,Spis1pr),Spis1pr=[],!.
spis_slov(Str,SSpisSl,SpisSl):- no1probel(Str,StrNoPr),slov1(StrNoPr,Slov),
          append(Slov,StrNoSlov,StrNoPr),append(SSpisSl,[Slov],SpisSl1),
          spis_slov(StrNoSlov,SpisSl1,SpisSl).
spis_slov(Str,SpisSl):- spis_slov(Str,[],SpisSl).

slov1([],Slov,Slov):- !.
slov1([H|_],Slov,Slov):- H=32,!.
slov1([H|T],SSlov,NSlov):- append(SSlov,[H],SSlov1),slov1(T,SSlov1,NSlov).
slov1(Spis,Slov):- slov1(Spis,[],Slov).

no1probel([],[]):- !.
no1probel([H|T],[H|T]):- H\=32,!.
no1probel([_|T],NSpis):- no1probel(T,NSpis).

chast_slov([],_,Slov,Slov):- !.
chast_slov([H|T],Kol,SSlov,Slov):- kol_ravn([H|T],H,Kol1),(Kol1>Kol->
          (SSlov1=H,Kol2=Kol1);(SSlov1=SSlov,Kol2=Kol)),
           chast_slov(T,Kol2,SSlov1,Slov).
chast_slov(Spis,Slov):- chast_slov(Spis,0,[],Slov).

kol_ravn([],_,Kol,Kol) :- !.
kol_ravn([H|T],Elem,KKol,Kol):- (H=Elem->KKol1 is KKol+1;KKol1 is KKol),
         kol_ravn(T,Elem,KKol1,Kol).
kol_ravn(Spis,Elem,Kol):- kol_ravn(Spis,Elem,0,Kol).

n1z4:- beret,read_spisstrok(Spis),spisok_slov_ch(Spis,SpisSlov),
       chast_slov(SpisSlov,Slov),write("Samoe chastoe slovo: "),
       write_stroka(Slov),seen.

%Zadanie 5

otdaet:- tell('C:/Users/Legto/OneDrive/Рабочий стол/Prolog/Prolog-/out.txt').

unic_spis([],[]):- !.
unic_spis([H|T],Spis):- rovn1(T,H,NSpis),unic_spis(NSpis,Spis1),
          append([H],Spis1,Spis).

rovn1(Spis,Elem,Spis):- not(ot_spis(Spis,Elem)),!.
rovn1(Spis,Elem,NSpis):- nomer_elem(Spis,Elem,N),elem1(Spis,N,Spis1),
      rovn1(Spis1,Elem,NSpis).

ot_spis([H|_],H):- !.
ot_spis([_|T],Elem):- ot_spis(T,Elem).

nomer_elem([H],Elem,NN,N):- ((H=Elem)->N is NN+1),!.
nomer_elem([H|T],Elem,NN,N):- NN1 is NN+1,((Elem=H)->N is NN1;
           nomer_elem(T,Elem,NN1,N)).
nomer_elem([H|T],Elem,N):- nomer_elem([H|T],Elem,0,N).

elem1([_|T],SSpis,N,N,NSpis):- append(SSpis,T,NSpis),!.
elem1([H|T],SSpis,NN,N,NSpis):- append(SSpis,[H],SSpis1),NN1 is NN+1,
      elem1(T,SSpis1,NN1,N,NSpis).
elem1(Spis,N,NSpis):- elem1(Spis,[],1,N,NSpis).

nopovtor(_,[],Spis,Spis):- !.
nopovtor(Spis,[H|T],SSpis,NSpis):- kol_ravn(Spis,H,Kol),(Kol=1->
         append(SSpis,[H],SSpis1);SSpis1=SSpis),nopovtor(Spis,T,SSpis1,NSpis).
nopovtor(Spis,Unic,NSpis):- nopovtor(Spis,Unic,[],NSpis).

n1z5:- beret,read_spisstrok(SpisStr),spisok_slov_ch(SpisStr,SpisSl),
       unic_spis(SpisSl,SpisSl1),nopovtor(SpisSl,SpisSl1,SpisSl2),
       seen,otdaet,write_spisstrok(SpisSl2),told.

%Nomer 3

neopr_stroka(A):- get0(X),neopr(X, A, []).
neopr(10,A,A):- !.
neopr(-1,A,A):- !.
neopr(X,A,B):- append(B,[X],B1),get0(X1),neopr(X1, A, B1).

year_spis([X1,X2,X3,X4],Year):- X11 is X1-48,X21 is X2-48,X31 is X3-48,
           X41 is X4-48,Year is (X11*1000+X21*100+X31*10+X41).

month(1,M):- M=[1103,1085,1074,1072,1088,1103],!.
month(2,M):- M=[1092,1077,1074,1088,1072,1083,1103],!.
month(3,M):- M=[1084,1072,1088,1090,1072],!.
month(4,M):- M=[1072,1087,1088,1077,1083,1103], !.
month(5,M):- M=[1084,1072,1103],!.
month(6,M):- M=[1080,1102,1085,1103], !.
month(7,M):- M=[1080,1102,1083,1103], !.
month(8,M):- M=[1072,1074,1075,1091,1089,1090,1072],!.
month(9,M):- M=[1089,1077,1085,1090,1103,1073,1088,1103], !.
month(10,M):- M=[1086,1082,1090,1103,1073,1088,1103], !.
month(11,M):- M=[1085,1086,1103,1073,1088,1103],!.
month(12,M):- M=[1076,1077,1082,1072,1073,1088,1103],!.

day([X1,X2],_, _):- (X1=48,X2>=49,X2=<57),!.
day([X1,X2],_, _):- (X1=49,X2>=48,X2=<57),!.
day([X1,X2],_, _):- (X1=50,X2>=48,X2=<56),!.
day([X1,X2],M,Y):- (X1=50,X2=57,M=2,0 is Y mod 4),!.
day([X1,X2],M,_):- (X1=50,X2=57,M\=2),!.
day([X1,X2],M,_):- (X1=51,X2=48,M\=2),!.
day([X1,X2],M,_):- (X1=51,X2=49,(M=1|M=3|M=5|M=7|M=8|M=10|M=12)),!.

year([X1,X2,X3,X4]):- (X1>=48,X1=<57,X2>=48,X2=<57,X3>=48,X3=<57,X4>=48,X4=<57).

probel([]):- !.
probel([H|T]):- (H=32->probel(T);fail).

date([],Date,Date):- !.
date(Spis,Date,Date):- probel(Spis),!.
date(Spis,Date,Date):- spis_slov(Spis,Slov),kol_elem(Slov,Kol),Kol<3,!.
date([D1|D],DDate,Date):-(([_|[D2|[32|NotDay]]]=[D1|D],[D1,D2]=SlovDay,
     slov1(NotDay,SlovMonth),month(Month,SlovMonth),
     append(SlovMonth,NotMonth1,NotDay),append([32],NotMonth,NotMonth1),
     [Y1|[Y2|[Y3|[Y4|_]]]]=NotMonth,[Y1,Y2,Y3,Y4]=SlovYear,year(SlovYear),
     year_spis(SlovYear,Year),day(SlovDay,Month,Year))->
    (append(SlovDay,[32],DayS),append(DayS,SlovMonth,DaSMo),
     append(DaSMo,[32],DaSMoS),append(DaSMoS,SlovYear,DaSMoSYe),
     append(DDate,[DaSMoSYe],DDate1),append([Y1,Y2],T,NotMonth),
     date(T,DDate1,Date));(date(D,DDate,Date))).
date(Str,Date):- date(Str,[],Date).

n3:- write("Vvedite stroky: "),neopr_stroka(S),date(S,Date),
     write("Date: "),nl,write_spisstrok(Date).

%Nomer 5

sortirovka([],[],Spis,Spis):- !.
sortirovka(SpisStr,Dlina,SSpis,Spis):- min_stroka(Dlina,Min),
           nomer_elem(Dlina,Min,N),nom_elem(SpisStr,N,Elem),
           append(SSpis,[Elem],SSpis1),elem1(SpisStr,N,SpisStr1),
           elem1(Dlina,N,Dlina1),sortirovka(SpisStr1,Dlina1,SSpis1,Spis).
sortirovka(SpisStr,NSpisStr):-dlina(SpisStr,Dlina),
           sortirovka(SpisStr,Dlina,[],NSpisStr).

nom_elem([],_,_,_) :- !.
nom_elem([_],NN,N,_):- NN1 is NN+1,NN1 < N,!.
nom_elem([H|T],NN,N,Elem):- NN1 is NN+1,((NN1 is N)->Elem=H;
         nom_elem(T,NN1,N,Elem)).
nom_elem([H|T],N,Elem):- nom_elem([H|T],0,N,Elem).

dlina([],Spis,Spis):- !.
dlina([H|T],SSpis,Spis):- kol_elem(H,Kol),append(SSpis,[Kol],SSpis1),
      dlina(T,SSpis1,Spis).
dlina(SpisStr,Dlina):- dlina(SpisStr,[],Dlina).

min_stroka([],Min,Min):- !.
min_stroka([H|T],MMin,Min):- (H<MMin->MMin1 is H;MMin1 is MMin),
            min_stroka(T,MMin1,Min).
min_stroka([H|T],Min) :- min_stroka(T,H,Min).


n5:- beret,read_spisstrok(Spis),sortirovka(Spis,NSpis),seen,
     otdaet,write_spisstrok(NSpis),told.

%Nomer 6

sort_kol_slov(SpisStr,NSpisStr):- kol_slov_spis(SpisStr,Kol),
              sortirovka(SpisStr,Kol,[],NSpisStr).

kol_slov_spis([],Spis,Spis):- !.
kol_slov_spis([H|T],SSpis,Spis):- kol_slov(H,Kol),append(SSpis,[Kol],SSpis1),
              kol_slov_spis(T,SSpis1,Spis).
kol_slov_spis(SpisStr,Kol):- kol_slov_spis(SpisStr,[],Kol).

kol_slov([],Kol,Kol):- !.
kol_slov(Spis,KKol,Kol):- no1probel(Spis,NoProbel),(NoProbel\=[]->
        (slov1(NoProbel,SlovOne),append(SlovOne,NoSlovOne,NoProbel),
         KKol1 is KKol+ 1);(NoSlovOne=[],KKol1 is KKol)),
         kol_slov(NoSlovOne,KKol1,Kol).
kol_slov(Spis,Kol):- kol_slov(Spis,0,Kol).

n6:- beret,read_spisstrok(SpisStr),sort_kol_slov(SpisStr,NSpisStr),
     seen,otdaet,write_spisstrok(NSpisStr),told.

%Nomer 7

spis_kol_slov_posle_nomer([],Spis,Spis):- !.
spis_kol_slov_posle_nomer([H|T],SSpis,Spis):- kol_slov_posle_nomer(H,Kol),
      append(SSpis,[Kol],SSpis1),spis_kol_slov_posle_nomer(T,SSpis1,Spis).
spis_kol_slov_posle_nomer(Spis,Kol):- spis_kol_slov_posle_nomer(Spis,[],Kol).

kol_slov_posle_nomer([_],Kol,Kol):- !.
kol_slov_posle_nomer([],Kol,Kol):- !.
kol_slov_posle_nomer([H|T],KKol,Kol):-((ch_nomer(H))->KKol1 is KKol+1;
                      KKol1 is KKol),kol_slov_posle_nomer(T,KKol1,Kol).
kol_slov_posle_nomer(Spis,Kol):-spis_slov(Spis,Slov),
                     kol_slov_posle_nomer(Slov,0,Kol).

ch_nomer([]):- !.
ch_nomer([H|T]):- (H>=48,H=<57),ch_nomer(T).

sortirovka_n7(SpisStr,NSpisStr):- spis_kol_slov_posle_nomer(SpisStr,Kol),
              sortirovka(SpisStr,Kol,[],NSpisStr).

n7:- beret,read_spisstrok(SpisStr),spis_kol_slov_posle_nomer(SpisStr,Kol),
     write(Kol),sortirovka_n7(SpisStr, NSpisStr),seen,otdaet,
     write_spisstrok(NSpisStr),told.
