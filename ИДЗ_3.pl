% �������� ����� ������ � ������
read_str_f(Str,N, Flag):-get0(X),r_str_f(X,Str,[],N,0, Flag).
r_str_f(-1,Str,Str,N,N, 0):-!.  % �������� �� ����� �����
r_str_f(10,Str,Str,N,N, 1):-!.  % �������� �� ����� ������
r_str_f(X,Str,TStr,N,K, Flag):-K1 is K+1,append(TStr,[X],NewTStr),get0(X1),r_str_f(X1,Str,NewTStr,N,K1, Flag).

% �������� ������ ������ �����
read_list_str(List):-read_str_f(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,0):-!.
read_list_str(Cur_list,List,1):-read_str_f(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).


% �������� ������ ������
write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).

check_str([37|_]):-!.
check_str(Str):- write_str(Str), nl.

% �������� ��������� � ������ ������ �����
process_list_str([]):-!.
process_list_str([H|T]):-check_str(H), process_list_str(T).


answer:-
    see('C:/�����������/�����/���� ������/������� ProLog/���/input_3.txt'), read_list_str(List), seen,
    tell('C:/�����������/�����/���� ������/������� ProLog/���/output_3.txt'), process_list_str(List), told.

