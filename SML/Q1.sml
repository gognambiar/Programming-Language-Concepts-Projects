Control.Print.printDepth := 40; 

fun reduce(f, b, [ ]) = b
 | reduce(f, b, h::t) = f(h, reduce(f, b, t));

datatype bstree =  leaf
				 | node of int * bstree * bstree;
				 
fun insert(v,leaf) = node(v, leaf, leaf)
	|	insert(v,node(d, l, r)) = 
		if (v<d) then  node(d, insert(v, l), r)                 
		else if (v>d) then node(d, l, insert(v, r))
		else node(d, l, r);
		
fun testcase1() = reduce(insert, leaf, [50,30,20,40,60]);



		