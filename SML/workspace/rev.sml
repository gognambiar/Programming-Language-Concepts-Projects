fun reverse([]) = []
	| reverse(h::t) = reverse(t) @[h];

fun tail_reverse(l) = 
	let fun rev([],ans) = ans
		| rev(h::t,ans) = rev(t,h::ans)
	 in rev(l,[])
	end;
