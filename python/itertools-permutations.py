from itertools import permutations

strings = raw_input().split()
string = strings[0]
if len(strings) > 1:
	length = int(strings[1])
else:
	length = None

perms = permutations(string, length)

for tup in sorted(list(perms)):
	print reduce(lambda x, y: x+y, tup)
