:- dynamic гуляет/2.
:- dynamic не_гуляет/2.

петя.
лена.
таня.

собака.
кошка.
хомяк.

женщина(лена).
женщина(таня).

не_гуляет(петя, кошка).

хозяин_женщина(хомяк).

гуляет(таня, кошка).

can_walk(Kid, Pet, A):-не_гуляет(Kid, Pet), append([], [], A), !.
can_walk(Kid, Pet, A):-хозяин_женщина(Pet), not(женщина(Kid)), append([], [], A).
can_walk(_, Pet, A):-append([Pet], [], A).

find_for(Kid, A):-can_walk(Kid, собака, A1), can_walk(Kid, кошка, A2),  can_walk(Kid, хомяк, A3), append(A1, A2, ATem), append(ATem, A3, A).

match(Kid):-гуляет(Kid, Pet), assertz((не_гуляет(Kid1, Pet):-Kid1 \= Kid)), write(Kid), write(Pet),!.
match(Kid):-find_for(Kid, A), length(A, 1), assertz((гуляет(Kid, Pet))), write(Kid), write(Pet), !.
match(Kid):-write("Wait, "), write(Kid), !.

match_kids:-гуляет(петя, _), гуляет(лена, _), гуляет(таня, _), !.
match_kids:-match(петя), match(лена), match(таня), match_kids.

answer:- assertz((не_гуляет(Kid1, кошка):-Kid1 \= таня)),
    match_kids,
    гуляет(петя, PetP), write(петя), write(" - "), write(PetP), nl,
    гуляет(лена, PetL), write(лена), write(" - "), write(PetL), nl,
    гуляет(таня, PetT), write(таня), write(" - "), write(PetT), !.

