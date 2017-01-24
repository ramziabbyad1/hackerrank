from math import *
degree_sign= u'\N{DEGREE SIGN}'
AB = float(raw_input().rstrip("\n"))
BC = float(raw_input().rstrip("\n"))
angle = int(round(degrees(asin(sin(atan(AB/BC))))))
print str(angle)+degree_sign
