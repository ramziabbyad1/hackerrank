from itertools import product

l1=[int(x) for x in raw_input().split()]
l2=[int(x) for x in raw_input().split()]

print reduce(lambda x,y: str(x) + " " + str(y), list(product(l1,l2)))

