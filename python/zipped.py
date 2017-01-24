

in1 = raw_input().rstrip().split()

N = int(in1[0])
X = int(in1[1])
scores = []
for x in xrange(X):
    scores += [[float(grade) for grade in raw_input().rstrip().split()]]

for s in zip(*scores):
    print '{:.1f}'.format(sum(s) / X)

