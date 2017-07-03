Control.Print.printDepth := 40; 

datatype 'a inf_list = lcons of 'a * (unit -> 'a inf_list);


fun church(x) = let fun thk() = church("(f" ^ x ^ ")")
				  in lcons("Lf.Lx.(f" ^ x ^")", thk)
				  end;

fun take(0, _) = []
| take(n, lcons(h, thk)) = h :: take(n-1, thk());

fun res() = take(5, church("x"));