from itertools import combinations_with_replacement

strings = raw_input().split()
string = strings[0]
if len(strings) > 1:
	length = int(strings[1])
else:
	length = None

combos = combinations_with_replacement(string, length)
sorted_combos = []
for tup in sorted(list(combos)):
	sorted_combos.append( sorted(tup))
for tup in  sorted(sorted_combos):
	print reduce(lambda x, y: x+y, tup)
