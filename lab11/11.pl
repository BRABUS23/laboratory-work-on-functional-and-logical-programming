:-dynamic country/2,gm/2,zipper/2,off_road/2,first/2,premium/2,rhombus/2.

read_str(A) :-get0(X),r_str(X, A, []).
r_str(10, A, A) :- !.
r_str(X, A, B) :-append(B, [X], B1),get0(X1),r_str(X1, A, B1).

country_r(X,Y):-repeat,(country(X,Y)->(nl,write(X),nl,write(Y),write("."),retract(country(X,Y)));X=nil,Y=nil).
gm_r(X,Y):-repeat,(gm(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(gm(X,Y)));X=nil,Y=nil).
zipper_r(X,Y):-repeat,(zipper(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(zipper(X,Y)));X=nil,Y=nil).
off_road_r(X,Y):-repeat,(off_road(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(off_road(X,Y)));X=nil,Y=nil).
first_r(X,Y):-repeat,(first(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(first(X,Y)));X=nil,Y=nil).
premium_r(X,Y):-repeat,(premium(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(premium(X,Y)));X=nil,Y=nil).
rhombus_r(X,Y):-repeat,(rhombus(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(rhombus(X,Y)));X=nil,Y=nil).

prTell:-tell('D:/SWI Prolog/labs/lab11/1.txt'),country_r(X1,_),X1=nil,told,
     tell('D:/SWI Prolog/labs/lab11/2.txt'),gm_r(X2,_),X2=nil,told,
     tell('D:/SWI Prolog/labs/lab11/3.txt'),zipper_r(X3,_),X3=nil,told,
     tell('D:/SWI Prolog/labs/lab11/4.txt'),off_road_r(X4,_),X4=nil,told,
     tell('D:/SWI Prolog/labs/lab11/5.txt'),first_r(X5,_),X5=nil,told,
     tell('D:/SWI Prolog/labs/lab11/6.txt'),premium_r(X6,_),X6=nil,told,
     tell('D:/SWI Prolog/labs/lab11/7.txt'),rhombus_r(X7,_),X7=nil,told.

prSee:-see('D:/SWI Prolog/labs/lab11/1.txt'), get0(Sym1), read_data(Sym1,1), seen,
     see('D:/SWI Prolog/labs/lab11/2.txt'), get0(Sym2), read_data(Sym2,2), seen,
     see('D:/SWI Prolog/labs/lab11/3.txt'), get0(Sym3), read_data(Sym3,3), seen,
     see('D:/SWI Prolog/labs/lab11/4.txt'), get0(Sym4), read_data(Sym4,4), seen,
     see('D:/SWI Prolog/labs/lab11/5.txt'), get0(Sym5), read_data(Sym5,5), seen,
     see('D:/SWI Prolog/labs/lab11/6.txt'), get0(Sym6), read_data(Sym6,6), seen,
     see('D:/SWI Prolog/labs/lab11/7.txt'), get0(Sym7), read_data(Sym7,7), seen.

read_data(-1, _) :- !.
read_data(_, Flag) :-read_str(Lang),name(X, Lang),read(Y),
            (
              Flag = 1 ->asserta(country(X, Y));
            (
              Flag = 2 ->asserta(gm(X, Y));
            (
              Flag = 3 ->asserta(zipper(X, Y));
            (
              Flag = 4 ->asserta(off_road(X, Y));
            (
              Flag = 5 ->asserta(first(X, Y));
            (
              Flag = 6 ->asserta(premium(X, Y));
            (
              Flag = 7 ->asserta(rhombus(X, Y))))))))),

         get0(Sym),
         read_data(Sym, Flag).


question1(X1):-write("what country is the car from?"),nl,
write("0-german"),nl,
write("1-french"),nl,
write("2-japanese"),nl,
write("3-korean"),nl,
write("4-american"),nl,
read(X1).

question2(X2):-write("the car brand is part of General Motors?"),nl,
write("0-yes"),nl,
write("1-no"),nl,
read(X2).

question3(X3):-write("the logo of the car brand has a zipper?"),nl,
write("0-yes"),nl,
write("1-no"),nl,
read(X3).

question4(X4):-write("the brand only creates an off-road car?"),nl,
write("0-yes"),nl,
write("1-no"),nl,
read(X4).

question5(X5):-write("the car brand was the first to create a car?"),nl,
write("0-yes"),nl,
write("1-no"),nl,
read(X5).

question6(X6):-write("premium brand ?"),nl,
write("0-yes"),nl,
write("1-no"),nl,
read(X6).

question7(X7):-write("the car brand contains a rhombus?"),nl,
write("0-yes"),nl,
write("1-no"),nl,
read(X7).

pr :-prSee,question1(X1),question2(X2),question3(X3),question4(X4),question5(X5),
        question6(X6),question7(X7),
        (country(X,X1),gm(X,X2),zipper(X,X3),off_road(X,X4),first(X,X5),
         premium(X,X6),rhombus(X,X7),write(X);
         (write("Auto -> "),
          read(auto),
          asserta(country(auto, X1)),
          asserta(gm(auto, X2)),
          asserta(zipper(auto, X3)),
          asserta(off_road(auto, X4)),
          asserta(first(auto, X5)),
          asserta(premium(auto, X1)),
          asserta(rhombus(auto, X1)),
          prTell,nl,
          write("Auto was added!"))).
