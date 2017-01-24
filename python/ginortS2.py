st = raw_input()
print reduce(lambda x,y: x+y, 
								             sorted(st, key=lambda x: (x.isdigit(), x.isdigit() and int(x) % 2 == 0, x.isupper(), x.islower(), x)))
