country(bmw,0).
country(mercedes-benz,0).
country(opel,0).
country(renault,1).
country(peugeot,1).
country(lexus,2).
country(mitsubishi,2).
country(subaru,2).
country(genesis,3).
country(kia,3).
country(chevrolet,4).
country(jeep,4).
country(cadillac,4).
country(ford,4).

gm(bmw,1).
gm(mercedes-benz,1).
gm(opel,0).
gm(renault,1).
gm(peugeot,1).
gm(lexus,1).
gm(mitsubishi,1).
gm(subaru,1).
gm(genesis,1).
gm(kia,1).
gm(chevrolet,0).
gm(jeep,1).
gm(cadillac,0).
gm(ford,1).

zipper(bmw,1).
zipper(mercedes-benz,1).
zipper(opel,0).
zipper(renault,1).
zipper(peugeot,1).
zipper(lexus,1).
zipper(mitsubishi,1).
zipper(subaru,1).
zipper(genesis,1).
zipper(kia,1).
zipper(chevrolet,0).
zipper(jeep,1).
zipper(cadillac,1).
zipper(ford,1).

off_road(bmw,1).
off_road(mercedes-benz,1).
off_road(opel,1).
off_road(renault,1).
off_road(peugeot,1).
off_road(lexus,1).
off_road(mitsubishi,1).
off_road(subaru,1).
off_road(genesis,1).
off_road(kia,1).
off_road(chevrolet,1).
off_road(jeep,0).
off_road(cadillac,1).
off_road(ford,1).

first(bmw,1).
first(mercedes-benz,1).
first(opel,1).
first(renault,1).
first(peugeot,1).
first(lexus,1).
first(mitsubishi,1).
first(subaru,1).
first(genesis,1).
first(kia,1).
first(chevrolet,1).
first(jeep,1).
first(cadillac,1).
first(ford,0).

premium(bmw,1).
premium(mercedes-benz,0).
premium(opel,1).
premium(renault,1).
premium(peugeot,1).
premium(lexus,0).
premium(mitsubishi,1).
premium(subaru,1).
premium(genesis,0).
premium(kia,1).
premium(chevrolet,1).
premium(jeep,1).
premium(cadillac,0).
premium(ford,1).

rhombus(bmw,1).
rhombus(mercedes-benz,1).
rhombus(opel,1).
rhombus(renault,0).
rhombus(peugeot,1).
rhombus(lexus,1).
rhombus(mitsubishi,0).
rhombus(subaru,1).
rhombus(genesis,1).
rhombus(kia,1).
rhombus(chevrolet,1).
rhombus(jeep,1).
rhombus(cadillac,1).
rhombus(ford,1).

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


pr:-question1(X1),
    question2(X2),
    question3(X3),
    question4(X4),
    question5(X5),
    question6(X6),
    question7(X7),

    country(X,X1),
    gm(X,X2),
    zipper(X,X3),
    off_road(X,X4),
    first(X,X5),
    premium(X,X6),
    rhombus(X,X7),
write(X),nl,fail.
