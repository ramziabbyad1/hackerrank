from collections import OrderedDict
import re
n = int(raw_input().rstrip())
count = OrderedDict([])
for i in xrange(n):
    word = raw_input().rstrip()
    if word in count:
        count[word] += 1
    else:
        count[word] = 1

print len(count)

print ' '.join(str(x) for x in count.values())


