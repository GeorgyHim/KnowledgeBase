:- dynamic ������/2.
:- dynamic ��_������/2.

����.
����.
����.

������.
�����.
�����.

�������(����).
�������(����).

��_������(����, �����).

������_�������(�����).

������(����, �����).

can_walk(Kid, Pet):-��_������(Kid, Pet), !, fail.
can_walk(Kid, Pet):-������_�������(Pet), not(�������(Kid)), !, fail.
can_walk(_, _):-!.

match(Kid):-������(Kid, Pet), assertz((��_������(Kid1, Pet):-Kid1 \= Kid)),!.
match(Kid):-��_������(Kid, Pet1), ��_������(Kid, Pet2), Pet1 \= Pet2, assertz((������(Kid, Pet):-Pet \= Pet1, Pet \= Pet2)),!.
match(Kid):-write("Wait, "), write(Kid), !.


match_kids:-������(����, _), ������(����, _), ������(����, _), !.
match_kids:-match(����), match(����), match(����), match_kids.

answer:-match_kids, ������(����, PetP), write(����), write(" - "), write(PetP), nl,
                    ������(����, PetL), write(����), write(" - "), write(PetL), nl,
                    ������(����, PetT), write(����), write(" - "), write(PetT), !.

