Control.Print.printDepth := 10; 

datatype 'a inf_list = lcons of 'a * ('a -> 'a inf_list);
				  
fun church(x)= let fun strapd(x) = "f(" ^ x ^ ")"
				   in
					lcons(x, church(strapd(x)))
				   end

fun take(0, _) = []
   | take(n, lcons(h,inf_list)) =  h :: take(n-1, inf_list);
