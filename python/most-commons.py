from collections import Counter
from operator import itemgetter
count = Counter(raw_input().rstrip("\n"))

most_com = count.most_common(3)

for com in sorted(sorted(most_com, key=itemgetter(0)), key=itemgetter(1), reverse=True):
	print com[0] + " " + str(com[1])
