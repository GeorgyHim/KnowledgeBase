:- dynamic гул€ет/2.
:- dynamic не_гул€ет/2.

пет€.
лена.
тан€.

собака.
кошка.
хом€к.

женщина(лена).
женщина(тан€).

не_гул€ет(пет€, кошка).

хоз€ин_женщина(хом€к).

гул€ет(тан€, кошка).

can_walk(Kid, Pet):-не_гул€ет(Kid, Pet), !, fail.
can_walk(Kid, Pet):-хоз€ин_женщина(Pet), not(женщина(Kid)), !, fail.
can_walk(_, _):-!.

match(Kid):-гул€ет(Kid, Pet), assertz((не_гул€ет(Kid1, Pet):-Kid1 \= Kid)),!.
match(Kid):-не_гул€ет(Kid, Pet1), не_гул€ет(Kid, Pet2), Pet1 \= Pet2, assertz((гул€ет(Kid, Pet):-Pet \= Pet1, Pet \= Pet2)),!.
match(Kid):-write("Wait, "), write(Kid), !.


match_kids:-гул€ет(пет€, _), гул€ет(лена, _), гул€ет(тан€, _), !.
match_kids:-match(пет€), match(лена), match(тан€), match_kids.

answer:-match_kids, гул€ет(пет€, PetP), write(пет€), write(" - "), write(PetP), nl,
                    гул€ет(лена, PetL), write(лена), write(" - "), write(PetL), nl,
                    гул€ет(тан€, PetT), write(тан€), write(" - "), write(PetT), !.

