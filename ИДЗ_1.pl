max(X,Y,X):-X>Y,!.
max(_,Y,Y).

is_simple(N):-N<2,!,fail.
is_simple(2):-!.
is_simple(N):-is_pr(N,2).
is_pr(N,N):-!.
is_pr(N,I):-Ost is N mod I, Ost > 0, I1 is I+1, is_pr(N,I1).

poly(A, B, N, Res):-Res is N*N+A*N+B.

funcAB(A, B, N0, Ans):-
    poly(A, B, N0, Res), is_simple(Res), N1 is N0 + 1, funcAB(A, B, N1, Ans);
    Ans is N0 - 1, !.

funcA(_, B0, Mx0, Res):-B0 > 50, Res is Mx0, !.
funcA(A, B0, Mx0, Res):-funcAB(A, B0, 0, Ans), max(Mx0, Ans, Tem), B1 is B0 + 1, funcA(A, B1, Tem, Res).




%f2 -> ... func(10, 20, 0, Ans)
