Control.Print.printDepth := 6;

datatype 'a tree = leaf of 'a | node of 'a tree * 'a tree;

val tr1 = node(node(leaf("a"),leaf("b")),node(leaf("c"),leaf("b")));

fun subst(leaf(x), v1, v2) = 
	if x=v1 then leaf(v2)
	else leaf(x)
  | subst(node(t1,t2),v1,v2)= node(subst(t1,v1,v2),subst(t2,v1,v2));

fun cat(leaf(x)) = x
	| cat(node(t1,t2)) = cat(t1) ^ " " ^ cat(t2);
  
val tr2 = subst(tr1,"b","x");
