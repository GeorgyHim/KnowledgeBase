readList([],0):-!.
readList([H|List], N):-read(H), N1 is N-1, readList(List, N1).

powerOf2(TemRes, N, N, Res):-Res is TemRes, !.
powerOf2(TemRes, Idx, N, Res):-P is TemRes * 2, I1 is Idx + 1, powerOf2(P, I1, N, Res).

power2(N, Res):-powerOf2(1, 0, N, Res).


% answer:-read(N), readList(A, N), read(V), could_sum(A, N, V, Ans), write(Ans).
