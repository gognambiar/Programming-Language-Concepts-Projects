Control.Print.printDepth := 40; 

fun reduce(f, b, [ ]) = b
 | reduce(f, b, h::t) = f(h, reduce(f, b, t));

datatype bstree =  leaf
				 | node of int * bstree * bstree;
				 
fun insert(v,leaf) = node(v, leaf, leaf)
	|	insert(v,node(d, l, r)) = 
		if (v<d) then  node(d, insert(v, l), r)                 (*insert(v, l) why can't it be like this*)
		else if (v>d) then node(d, l, insert(v, r))
		else node(d, l, r);
		
fun testcase1() = reduce(insert, leaf, [20,30,40,50,60]);


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
