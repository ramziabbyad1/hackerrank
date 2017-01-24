

no_lines = 4
lines = []
for i in xrange(no_lines):
	lines.append(sys.stdin.readline())

nm = lines[0].split(" ")
n = int(nm[0])
m = int(nm[1])

arr = lines[1].split(" ")
A = set(lines[2].split(" "))
B = set(lines[3].split(" "))

happiness = 0

for i in xrange(n):
	if arr[i] in A:
		happiness += 1
	else:
		happiness -= 1

print happiness

