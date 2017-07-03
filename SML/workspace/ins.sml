fun insert(v,[]) = [v]
 | insert(v,h::t) = if v < h
		    then v::h::t
		    else h::insert(v,t);
