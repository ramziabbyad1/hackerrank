from itertools import *

n = int(raw_input().rstrip("\n"))
lst = raw_input().rstrip("\n").split(" ")
k = int(raw_input().rstrip("\n"))

lst_len = n
index_rg = range(1, lst_len+1)
combos = list(combinations(index_rg, k))

possibilities = len(combos)

numerator = 0

for t in combos:
		for x in t:
			if lst[x-1] == 'a':
				numerator += 1
				break

prob = float(numerator) / float(possibilities)

print prob
