read_str(S):-get0(X), r_str(X,S,[]).

r_str(10,S,S):-!.
r_str(X,S,B):-append(B,[X],B1),  get0(X1),  r_str(X1,S,B1).
