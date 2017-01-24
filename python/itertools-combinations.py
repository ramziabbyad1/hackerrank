from itertools import combinations

strings = raw_input().split()
string = strings[0]
if len(strings) > 1:
	length = int(strings[1])
else:
	length = None

for i in xrange(1, length + 1):
	combos = combinations(string, i)
	sorted_combos = []
	for tup in sorted(list(combos)):
		sorted_combos.append( sorted(tup))
	for tup in  sorted(sorted_combos):
		print reduce(lambda x, y: x+y, tup)
