def flatten(ls):
	for v in ls:
		if isinstance(v,int):
			yield v
		else:
			yield from flatten(v)

l = [[[1],2],[[[[[3]]]]],[4,[5],[[6]]]]
print ([x for x in flatten(l)])
