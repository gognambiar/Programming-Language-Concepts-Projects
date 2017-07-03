pretty_print(X) :-
	write(X).
pretty_print(l(X, T)) :-
	write('L'),
	write(X),
	write('.'),
	pretty_print(T).
pretty_print(a(T1, T2)) :-
	write('('),
	pretty_print(T1),
		write(' '),
			pretty_print(T2),
				write(')').

