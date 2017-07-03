Control.Print.printDepth := 6;

datatype 'a tree = leaf of 'a | node of 'a tree * 'a tree;

fun cat(leaf(x)) = x
	| cat(node(t1,t2)) = cat(t1) ^ " " ^ cat(t2);

val tr = node(node(leaf("a"),leaf("b")),node(leaf("c"),leaf("b")));
