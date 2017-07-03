Control.Print.printDepth := 40; 

datatype bstree =  leaf
				 | node of int * bstree * bstree;

(*Question 1*)
fun insert(v,leaf) = node(v, leaf, leaf)
	|	insert(v,node(d, l, r)) = 
		if (v<d) then  node(d, insert(v, l), r)                 
		else if (v>d) then node(d, l, insert(v, r))
		else node(d, l, r);
				 
fun testcase1() = reduce(insert, leaf, [50,30,20,40,60]);

datatype 'a ntree = nleaf of 'a
					| nnode of 'a ntree list;

fun map(f, [ ]) = [ ]
 | map(f, h::t) = f(h) :: map(f, t);

 fun reduce(f, b, [ ]) = b
 | reduce(f, b, h::t) = f(h, reduce(f, b, t));

(*Question 2*)
fun subst(nleaf(x), v1, v2)=
		if (x=v1) then nleaf(v2) else nleaf(x)
	|	subst(nnode(nodelist), v1, v2)=
			let
				fun replace(tr) = subst(tr, v1, v2)
			in
				nnode(map(replace, nodelist))
			end			

fun cat(nleaf(x)) = x
	| cat(nnode(nodelist)) = 
		let 
			fun concat(x1,x2)= cat(x1) ^ " " ^ x2
		in 
			reduce(concat, "", nodelist)
		end

fun test_subst() = subst(nnode([nleaf("x"), nnode([nleaf("y"), nleaf("x"), nleaf("z")])]), "x", "w");

fun test_cat() = cat(nnode([nleaf("x"),nnode([nleaf("y"),nleaf("x"),nleaf("z")])]));

(*Question 3*)
fun dfirst2(tr)=
	let
		fun df(node(v,leaf,leaf),node(b,leaf,leaf)::nodelist) = 
			if(b<v) then [node(b,leaf,leaf)] @ nodelist @ [node(v,leaf,leaf)]
			else df(node(b,leaf,leaf), nodelist @ [node(v,leaf,leaf)])
		| df(node(v,leaf,leaf),top::nodelist) =  df(top,nodelist @ [node(v,leaf,leaf)])
		| df(node(v,leaf,right),nodelist) = df(right,nodelist@[node(v,leaf,leaf)])
		| df(node(v,left,right),nodelist) = df(left,[node(v,leaf,right)]@nodelist)
	in
		df(tr,[])
end

fun test_dfirst2() = dfirst2(testcase1());

(*Question 4*)

datatype 'a inf_list = lcons of 'a * (unit -> 'a inf_list);

fun church(x) = let fun thk() = church("(f" ^ x ^ ")")
				  in lcons("Lf.Lx.(f" ^ x ^")", thk)
				  end;

fun take(0, _) = []
| take(n, lcons(h, thk)) = h :: take(n-1, thk());

fun res() = take(5, church("x"));