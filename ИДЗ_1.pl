max2(X, Y, COld, _, Res, CRes):-X>=Y, Res is X, CRes is COld,!.
max2(_, Y, _, CNew, Res, CRes):-Res is Y, CRes is CNew.

max3(X, Y, AOld, _, BOld, _, Res, ARes, BRes):-X>=Y, Res is X, ARes is AOld, BRes is BOld, !.
max3(_, Y, _, ANew, _, BNew, Res, ARes, BRes):-Res is Y, ARes is ANew, BRes is BNew.


is_simple(N):-N<2,!,fail.
is_simple(2):-!.
is_simple(N):-is_pr(N,2).
is_pr(N,N):-!.
is_pr(N,I):-Ost is N mod I, Ost > 0, I1 is I+1, is_pr(N,I1).

poly(A, B, N, Res):-Res is N*N+A*N+B.

funcAB(A, B, N0, Ans):-
    poly(A, B, N0, Res), is_simple(Res), N1 is N0 + 1, funcAB(A, B, N1, Ans);
    Ans is N0 - 1, !.

funcA(_, B0, TemMxRes, MaxB0, Res, ResB):-B0 > 1000, Res is TemMxRes, ResB is MaxB0, !.
funcA(A, B0, TemMxRes, MaxB0, Res, ResB):-
    funcAB(A, B0, 0, Ans), max2(TemMxRes, Ans, MaxB0, B0, Tem, TemB), B1 is B0 + 1, funcA(A, B1, Tem, TemB, Res, ResB).

func(A0, TemMxRes, MaxA0, MaxB0, Res, ResA, ResB):-A0 > 1000, Res is TemMxRes, ResA is MaxA0, ResB is MaxB0, !.
func(A0, TemMxRes, MaxA0, MaxB0, Res, ResA, ResB):-
	funcA(A0, -1000, 0, -1, TemRes, TemMxB), max3(TemMxRes, TemRes, MaxA0, A0, MaxB0, TemMxB, Tem, TemA, TemB), A1 is A0 + 1, func(A1, Tem, TemA, TemB, Res, ResA, ResB).


f(Res, ResA, ResB):-func(-1000, 0, 0, 0, TemRes, TemResA, TemResB), Res is TemRes, ResA is TemResA, ResB is TemResB, !.

answer(Product):-f(_, ResA, ResB), Product is ResA * ResB.
