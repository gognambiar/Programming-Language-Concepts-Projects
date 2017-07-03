(*Map Function*)
fun map(f, [ ]) = [ ]
 | map(f, x::t) = f(x) :: map(f, t);

(*Reduce Function*) 
fun reduce(f, b, [ ]) = b
 | reduce(f, b, x::t) = f(x, reduce(f, b, t));

(*ntree definition*)
datatype 'a ntree = leaf of 'a | node of 'a ntree list;

(*subst Function*) 
fun subst(tr,v1,v2) = 
	let 
	fun sub(leaf(x),v1,v2) = 
		if x = v1 then leaf(v2) else leaf(x)
	| sub(node(list_of_trees),v1,v2) = let 
											fun h(n) = sub(n,v1,v2) 
										in 
											node(map(h,list_of_trees)) 
										end

	in
	 sub(tr,v1,v2)
	end
(*toString Function*) 
fun toString(tr) = 
	let
	fun conc(leaf(x)) = x
	| conc(node(list_of_trees)) = let
										fun h(x1,x2) = conc(x1) ^ " " ^ x2
								  in
										reduce(h, "", list_of_trees)
								  end
	
	
	
	in
		conc(tr)
	end


fun testcase() = 
 toString(node([leaf("x"),node([leaf("y"),leaf("x"),leaf("z")])])) 	 
 subst(node([leaf("x"),node([leaf("y"),leaf("x"),leaf("z")])]),"x","w") 


