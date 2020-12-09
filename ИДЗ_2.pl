readList([],0):-!.
readList([H|List], N):-read(H), N1 is N-1, readList(List, N1).

powerOf2(TemRes, N, N, Res):-Res is TemRes, !.
powerOf2(TemRes, Idx, N, Res):-P is TemRes * 2, I1 is Idx + 1, powerOf2(P, I1, N, Res).
power2(N, Res):-powerOf2(1, 0, N, Res).

sum_with_mask(A, Mask, Sum):-sum_with_mask2(A, 0, Mask, Sum).
sum_with_mask2([], _, _, 0):-!.
sum_with_mask2([H|T], Idx, Mask, Sum):-I1 is Idx + 1, sum_with_mask2(T, I1, Mask, Sum1), M is getbit(Mask, Idx), Sum is Sum1 + H * M.

could_sum_with_mask(A, V, Mask, Ans):-sum_with_mask(A, Mask, Sum), Sum = V, Ans is 1, !.
could_sum_with_mask(_, _, _, Ans):-Ans is 0.

could_sum_partly(_, N, _, Mask):-power2(N, Pow2), Mask >= Pow2, !, fail.
could_sum_partly(A, _, V, Mask):-could_sum_with_mask(A, V, Mask, AnsTemp), AnsTemp > 0,!.
could_sum_partly(A, N, V, Mask):-Mask1 is Mask + 1, could_sum_partly(A, N, V, Mask1).

could_sum(A, N, V):-could_sum_partly(A, N, V, 1).

answer:-read(N), readList(A, N), read(V), could_sum(A, N, V).
