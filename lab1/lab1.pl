man(belomir).
man(darimir).
man(bogumir).
man(bogdan).
man(boeslav).
man(dobrovit).
man(boris).
man(vasilko).
man(vaclav).
man(vladislav).
man(vladimir).
man(venceslav).
man(vsevolod).
man(vsemil).
man(vseslav).
man(godimir).
man(peresvet).

woman(alina).
woman(adelya).
woman(beloslava).
woman(vladislava).
woman(vladlena).
woman(voislava).
woman(krasnoslava).
woman(danaya).
woman(vera).
woman(dobroslava).
woman(elena).
woman(eseniya).
woman(miroslava).
woman(mlada).
woman(marfa).
woman(marusya).
woman(nadejda).

parent(vladislav,belomir).
parent(vladislav,vladimir).
parent(vladislav,boris).
parent(vladislav,bogdan).

parent(alina,belomir).
parent(alina,vladimir).
parent(alina,boris).
parent(alina,bogdan).

parent(belomir,vsevolod).
parent(belomir,dobrovit).
parent(belomir,vsemil).
parent(belomir,peresvet).

parent(adelya,vsevolod).
parent(adelya,dobrovit).
parent(adelya,vsemil).
parent(adelya,peresvet).

parent(darimir,godimir).
parent(darimir,marfa).
parent(darimir,vaclav).
parent(darimir,vera).

parent(vladislava,godimir).
parent(vladislava,marfa).
parent(valdislava,vaclav).
parent(valdislava,vera).

parent(godimir,mlada).
parent(godimir,elena).

parent(nadejda,mlada).
parent(nadejda,elena).

parent(marfa,danaya).

parent(vsemil,danaya).

men:-man(X),write(X),nl,fail.
women:- woman(X), write(X), nl,fail.

children(X,Y):-parent(Y,X).
allchildren(Y):-children(X,Y),write(X),nl,fail.

mother(X,Y):-parent(X,Y),woman(X).
mother(X):-mother(Y,X),write(Y).

son(X,Y):-parent(X,Y),man(Y).
son(X):-son(Y,X),write(Y).

brother(X,Y):-parent(Z,X),parent(Z,Y),man(Z),man(X),not(X=Y),!.
brothers(X):-mother(Z,X),mother(Z,Y),man(Y),X\=Y,write(Y),nl,fail.

husband(X,Y):-children(Z,X),children(Z,Y),man(X).
husband(X):-husband(Y,X),write(Y).

b_s(X,Y):-parent(Z,X),parent(Z,Y),man(Z),not(X=Y),!.
b_s(X):-b_s(Y,X),write(Y),write(", "),fail.

grand_pa(X,Y):-parent(Z,X),parent(Z,Y),man(X).
grand_pas(X):-grand_pa(Y,X),write(Y),write(", "),fail.

grand_son(X,Y):-parent(Y,Z),parent(Z,X),man(X).
grand_sons(X):-grand_son(Y,X),write(Y),write(", "),fail.

grand_pa_and_son(X,Y):-grand_pa(X,Y)\=grand_pa(Y,X),man(X),man(Y).

grand_pa_and_da(X,Y):-parent(X,Z),parent(Z,Y),man(X),woman(Y).

uncle(X,Y):-parent(Z,D),parent(D,Y),parent(Z,X),X\=D,man(X),man(Z).
uncles(X):-uncle(Y,X),write(Y),write(", "),fail.

niece(X,Y):-parent(Z,Y),parent(Z,D),parent(D,X),Y\=D,woman(Z),woman(X).
nieces(X):-niece(Y,X),write(Y),write(", "),fail.
