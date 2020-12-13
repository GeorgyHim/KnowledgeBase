:- dynamic гул€ет/2.

женщина(лена).
женщина(тан€).

хоз€ин_женщина(хом€к).

гул€ет(тан€, кошка).
can_walk(Kid, Pet, []):-гул€ет(X, Pet), X \= Kid, !.
can_walk(Kid, Pet, []):-хоз€ин_женщина(Pet), not(женщина(Kid)).
can_walk(_, Pet, [Pet]).

find_for(Kid, Res):-can_walk(Kid, собака, A1), can_walk(Kid, кошка, A2),  can_walk(Kid, хом€к, A3), append(A1, A2, ATem), append(ATem, A3, Res).

match(Kid):-гул€ет(Kid, _), !.
match(Kid):-find_for(Kid, [Pet]), assertz((гул€ет(Kid, Pet))), !.
match(_):-!.

match_kids:-гул€ет(пет€, _), гул€ет(лена, _), гул€ет(тан€, _), !.
match_kids:-match(пет€), match(лена), match(тан€), match_kids.

answer:- match_kids,
         гул€ет(пет€, PetP), write(пет€), write(" - "), write(PetP), nl,
         гул€ет(лена, PetL), write(лена), write(" - "), write(PetL), nl,
         гул€ет(тан€, PetT), write(тан€), write(" - "), write(PetT).

