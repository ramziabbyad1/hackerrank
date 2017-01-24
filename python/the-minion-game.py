from sys import argv

script, string = argv

def compute(i, n):
    return (n - i)

vowels = set(['A', 'E', 'I', 'O', 'U'])
kevin_points = 0
stuart_points = 0
index = 0
str_len = len(string)


for c in string:
    if c in vowels:
        kevin_points += compute(index, str_len)
    else:
        stuart_points += compute(index, str_len)

    index += 1

if kevin_points > stuart_points:
    print "Kevin, %d" % kevin_points
elif stuart_points > kevin_points:
    print "Stuart, %d" % stuart_points
else:
    print "Draw"

