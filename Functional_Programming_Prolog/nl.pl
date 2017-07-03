factor1(0,F,T) :-
	atom_concat('',T,F).
factor1(N,F,T) :-
	N>0,
	N1 is N-1, 
	factor1(N1,F1,T),
	atom_concat(F1,'a(f,',F).

factor2(0,F,T) :-
	atom_concat(T,'x))',F).
factor2(N,F,T) :-
	N>0,
	N1 is N-1, 
	factor2(N1,F1,T),
	atom_concat(F1,')',F).

church(N,F) :-
	T = 'l(f,l(x,',
	factor1(N,F1,T),
	factor2(N,F,F1).
