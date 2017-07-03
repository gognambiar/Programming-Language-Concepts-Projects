Control.Print.printDepth := 10; 

(*tree type definition*)
datatype 'a tree = leaf|
				node of 'a  * 'a tree * 'a tree;

(*insert Function*) 
fun insert (i, leaf)	=  node(i,leaf,leaf)
	| insert (i,node(v,left,right)) = 
	if i < v then 
		(node(v,insert(i,left),right))
	else
		if i > v then
			(node(v, left, insert(i,right)))
		else
			(node(v,left,right))

(*testcase Function*) 
fun testcase() =
 let val t1 = node(100,leaf,leaf);
 val t2 = insert(50, t1);
 val t3 = insert(150, t2);
 val t4 = insert(200, t3);
 val t5 = insert(125, t4);
 val t6 = insert(175, t5);
 val t7 = insert(250, t6);
 val t8 = insert(25, t7);
 val root = insert(75, t8);
 in root
 end

(*dfirst2 Function
First arg : List of trees
Second arg : accumulator - list of values 
*) 
fun dfirst2(tr) =
let
		fun df(node(v,leaf,leaf),node(b,leaf,leaf)::treelist) =  [node(b,leaf,leaf)] @ treelist @ [node(v,leaf,leaf)]
		| df(node(v,leaf,leaf),top::treelist) =  df(top,treelist @ [node(v,leaf,leaf)])
		| df(node(v,leaf,right),treelist) = df(right,treelist@[node(v,leaf,leaf)])
		| df(node(v,left,right),treelist) = df(left,[node(v,leaf,right)]@treelist)
in
        df(tr,[])
end

fun test_dfirst2() = dfirst2(testcase());
