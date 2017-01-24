from itertools import izip_longest, starmap, product

def max_mod_sq(arr, m):
#	print "params"
#	print arr, m
	max_mod = arr[0]*arr[0] % m
	for i in xrange(1, len(arr)):
		modded = arr[i]*arr[i] % m
		if modded > max_mod:
			max_mod = modded
	return max_mod

(k, m) = [int(x) for x in raw_input().split()]
star_sum = 0
for i in xrange(k):
	lst_in = [int(x) for x in raw_input().split()]
	(n, lst) = (lst_in[0], lst_in[1:])
	max_mod_sq_var = max_mod_sq(lst, m)
	#print max_mod_sq_var
	star_sum += max_mod_sq_var

print star_sum

