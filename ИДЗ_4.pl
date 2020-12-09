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

can_walk(Kid, Pet, A):-��_������(Kid, Pet), append([], [], A), !.
can_walk(Kid, Pet, A):-������_�������(Pet), not(�������(Kid)), append([], [], A).
can_walk(_, Pet, A):-append([Pet], [], A).

find_for(Kid, A):-can_walk(Kid, ������, A1), can_walk(Kid, �����, A2),  can_walk(Kid, �����, A3), append(A1, A2, ATem), append(ATem, A3, A).

match(Kid):-������(Kid, Pet), assertz((��_������(Kid1, Pet):-Kid1 \= Kid)), write(Kid), write(Pet),!.
match(Kid):-find_for(Kid, A), length(A, 1), assertz((������(Kid, Pet))), write(Kid), write(Pet), !.
match(Kid):-write("Wait, "), write(Kid), !.

match_kids:-������(����, _), ������(����, _), ������(����, _), !.
match_kids:-match(����), match(����), match(����), match_kids.

answer:- assertz((��_������(Kid1, �����):-Kid1 \= ����)),
    match_kids,
    ������(����, PetP), write(����), write(" - "), write(PetP), nl,
    ������(����, PetL), write(����), write(" - "), write(PetL), nl,
    ������(����, PetT), write(����), write(" - "), write(PetT), !.

