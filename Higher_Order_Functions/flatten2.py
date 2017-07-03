def list_gen(l, thk):
	n = len(l)
	for i in range(0,n):
		thk(l[i])

def thunk(x):
	m = len(x)
	for j in range(0,m):
		if isinstance(x[j], int):
			ans.append(x[j])
		else:
			thunk(x[j])			
		


l = [[[1],2],[[[[[3]]]]],[4,[5],[[6]]]]
ans = []
list_gen(l, thunk)
print(ans)
