:- dynamic ������/2.

�������(����).
�������(����).

������_�������(�����).

������(����, �����).
can_walk(Kid, Pet, []):-������(X, Pet), X \= Kid, !.
can_walk(Kid, Pet, []):-������_�������(Pet), not(�������(Kid)).
can_walk(_, Pet, [Pet]).

find_for(Kid, Res):-can_walk(Kid, ������, A1), can_walk(Kid, �����, A2),  can_walk(Kid, �����, A3), append(A1, A2, ATem), append(ATem, A3, Res).

match(Kid):-������(Kid, _), !.
match(Kid):-find_for(Kid, [Pet]), assertz((������(Kid, Pet))), !.
match(_):-!.

match_kids:-������(����, _), ������(����, _), ������(����, _), !.
match_kids:-match(����), match(����), match(����), match_kids.

answer:- match_kids,
         ������(����, PetP), write(����), write(" - "), write(PetP), nl,
         ������(����, PetL), write(����), write(" - "), write(PetL), nl,
         ������(����, PetT), write(����), write(" - "), write(PetT).

