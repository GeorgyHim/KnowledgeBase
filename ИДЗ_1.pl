max(X,Y,X):-X>Y,!.
max(_,Y,Y).

max2(X, Y, COld, _, Res, CRes):-X>=Y, Res is X, CRes is COld,!.
max2(_, Y, _, CNew, Res, CRes):-Res is Y, CRes is CNew.

is_simple(N):-N<2,!,fail.
is_simple(2):-!.
is_simple(N):-is_pr(N,2).
is_pr(N,N):-!.
is_pr(N,I):-Ost is N mod I, Ost > 0, I1 is I+1, is_pr(N,I1).

poly(A, B, N, Res):-Res is N*N+A*N+B.

funcAB(A, B, N0, Ans):-
    poly(A, B, N0, Res), is_simple(Res), N1 is N0 + 1, funcAB(A, B, N1, Ans);
    Ans is N0 - 1, !.

funcA(_, B0, Mx0, MaxB0, Res, MaxB):-B0 > 1000, Res is Mx0, MaxB is MaxB0, !.
funcA(A, B0, Mx0, MaxB0, Res, MaxB):-funcAB(A, B0, 0, Ans), max2(Mx0, Ans, MaxB0, B0, Tem, TemB), B1 is B0 + 1, funcA(A, B1, Tem, TemB, Res, MaxB).

func(A0, Mx0, Res):-A0 > 1000, Res is Mx0, !.
func(A0, Mx0, Res):-funcA(A0, -1000, 0, MxA), max(Mx0, MxA, Tem), A1 is A0 + 1, func(A1, Tem, Res).


%f2 -> ... func(10, 20, 0, Ans)
