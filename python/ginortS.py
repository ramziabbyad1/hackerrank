from functools import cmp_to_key

def cmp(x, y):
#    print "x = %s, y = %s" % (x, y)
#    print x.isupper(), y.islower()
#    print y.isupper(), x.islower()
    if x.isupper() and y.islower():
        return 1
    elif y.isupper() and x.islower():
        return -1
    elif x.isupper() and y.isdigit():
        return -1
    elif x.isdigit() and y.isupper():
        return 1
    elif x.islower() and y.isdigit():
        return -1
    elif x.isdigit() and y.islower():
        return 1
    elif x.isdigit() and y.isdigit():
        if int(x) % 2 == 0 and int(y) % 2 != 0:
            return 1
        elif int(x) % 2 != 0 and int(y) % 2 == 0:
            return -1
        else:
            return 0
    else:
        if x < y:
            return -1
        elif x > y:
            return 1
        else:
            return 0

st = 'Sorting1234'
print sorted(st, key=cmp_to_key(cmp))
        
