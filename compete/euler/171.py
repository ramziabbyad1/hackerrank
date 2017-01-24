import math
import time
k = int(raw_input())

def square_digits(x):
    d = 1
    running_sum = 0
    while x /d > 0:
        digit = (x / d) % 10
        running_sum += digit*digit
        ##print "d = {:d}\n".format(d)
        d *= 10
    return running_sum

def is_square(x):
    return math.sqrt(x) == int(math.sqrt(x))

#print square_digits(0)
#print square_digits(1)
#print square_digits(21)
#print square_digits(213)

#print is_square(2)
#print is_square(3)
#print is_square(4)
#print is_square(8)
#print is_square(36)
start_time = time.time()
running_sum = 0
m = pow(10, 9) + 7
for i in xrange(k+1):
    x = square_digits(i)
    #print( "sum of squares for {:d} is {:d}\n ".format(i, x) )
    is_sq = is_square(x)
    #print "{:d} is a perfect square? {:s}\n".format(x, str(is_sq))
    if is_sq:
        running_sum += i
        running_sum %= m

print "the sum is {:d}\n".format(running_sum)
print("k=10000 with print takes 1.24s\n ")
print("----{:f} seconds -------".format(time.time()-start_time))
