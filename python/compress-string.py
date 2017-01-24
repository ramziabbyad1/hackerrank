import itertools
string = raw_input()

string_out = ""
for k, g in itertools.groupby(string):
    string_out += "("+str(len(list(g)))+", " + str(k) + ") "
print string_out
