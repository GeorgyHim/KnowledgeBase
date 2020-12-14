write_str([]):-!.
write_str([H|T]):-put(H), write_str(T).

in_list([H|_], H).
in_list([_|T], E):-in_list(T, E).

count_l(L, A, Res):-count_l(L, A, 0, Res).
count_l(_, [], TRes, Res):- Res is TRes.
count_l(L, [L|T], TRes, Res):-TRes1 is TRes + 1, count_l(L, T, TRes1, Res), !.
count_l(L, [_|T], TRes, Res):-count_l(L, T, TRes, Res).

check_perm(Perm, K):-
    count_l(97, Perm, ResA), count_l(98, Perm, ResB), count_l(99, Perm, ResC),
    count_l(100, Perm, ResD), count_l(101, Perm,ResE), count_l(102, Perm, ResF),
    Res = [ResA, ResB, ResC, ResD, ResE, ResF], check_perm2(Res, K), write_str(Perm), nl, !.
check_perm2(Res, K):-count_l(5, Res, C5), C5 = 1, count_l(K, Res, Ck), Ck = 1.

b_a_w(_, 0, K, PermRes):-check_perm(PermRes, K), !, fail.
b_a_w(A, N, K, Perm):-N > 0, in_list(A, El), N1 is N-1, b_a_w(A, N1, K, [El|Perm]).

build_all_words(_, N, K):-N < K + 5, !, fail. % Слово должно быть не короче чем K+5
build_all_words(_, N, K):-N > K + 5 + 4, !, fail. % И не длиннее чем K+9
build_all_words(_, _, 5):-!, fail. % K не должно быть равно 5, иначе 2 буквы встретятся 5 раз
build_all_words(_, N, K):-K = 1, N >= 7, !, fail. % В этом случае будет 2 буквы по 1 разу
build_all_words(A, N, K):-b_a_w(A, N, K,[]).

answer:-read(N), read(K),
     tell('C:/Химшиашвили/Учеба/Базы знаний/Задания ProLog/ИДЗ/output_5.txt'),
     build_all_words([97, 98, 99, 100, 101, 102], N, K),
     told.
% Массив - это 'abcdef'
