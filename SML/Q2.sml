Control.Print.printDepth := 40; 

fun map(f, [ ]) = [ ]
 | map(f, h::t) = f(h) :: map(f, t);

fun reduce(f, b, [ ]) = b
 | reduce(f, b, h::t) = f(h, reduce(f, b, t));

datatype 'a ntree = leaf of 'a
					| node of 'a ntree list;

					
fun subst(leaf(x), v1, v2)=
		if (x=v1) then leaf(v2) else leaf(x)
	|	subst(node(nodelist), v1, v2)=
			let
				fun replace(tr) = subst(tr, v1, v2)
			in
				node(map(replace, nodelist))
			end			

fun cat(leaf(x)) = x
	| cat(node(nodelist)) = 
		let 
			fun concat(x1,x2)= cat(x1) ^ " " ^ x2
		in 
			reduce(concat, "", nodelist)
		end

fun test_subst() = subst(node([leaf("x"), node([leaf("y"), leaf("x"), leaf("z")])]), "x", "w");
fun test_cat() = cat(node([leaf("x"),node([leaf("y"),leaf("x"),leaf("z")])]));
