datatype 'a inf_list = lcons of 'a * (unit -> 'a inf_list);

fun nums(n) = lcons(n, nums(n+1));

fun take(0, _) = []
   | take(n, lcons(h,inf_list)) =  h :: take(n-1, inf_list);
