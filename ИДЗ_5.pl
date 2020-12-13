write_str([]):-!.
write_str([H|T]):-put(H), write_str(T).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

in_list([H|_], H).
in_list([_|T], E):-in_list(T, E).

b_a_w(A,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_w(A,N,Perm):-in_list(A, El),N1 is N-1,b_a_w(A,N1,[El|Perm]).

build_all_words:-read_str(A,N), read(K), b_a_w(A,K,[]).
