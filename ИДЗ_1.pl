is_simple(N):-N<2,!,fail.
is_simple(2):-!.
is_simple(N):-is_pr(N,2).
is_pr(N,N):-!.
is_pr(N,I):-Ost is N mod I, Ost > 0, I1 is I+1, is_pr(N,I1).

poly(A, B, N, Res):-Res is N*N+A*N+B.

func(A, B, N0, Ans):-
    poly(A, B, N0, Res), is_simple(Res), N1 is N0 + 1, func(A, B, N1, Ans);
    Ans is N0 - 1, !.





%f2 -> ... func(10, 20, 0, Ans)
