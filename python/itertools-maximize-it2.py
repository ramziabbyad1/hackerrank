from itertools import *

(K, M) = (int(x) for x in input().split())
#print(K, M)

sq_list = []
for i in range(K):
    l = set( ((int(x)*int(x)) % M) for x in input().split()[1:])
    #print("list = ", l)
    sq_list.append(l)

p = list(product(*sq_list))

#print("sq_list = ", sq_list)
#print("p = ", p)

sums = map(lambda x: sum(x) % M, p)

print(max(list(sums)))

