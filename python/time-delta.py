from datetime import datetime
from datetime import timedelta

test_cases = int(raw_input().rstrip('\n'))
#print test_cases
for i in xrange(test_cases):
    ex = raw_input().rstrip('\n')
    stamp = ' '.join(ex.split()[0:5])
    offset = ex.split()[5]
    hours_offset = int(offset) / 100
    min_offset = int(offset) % 100
    secs_offset = 60 * (60 * hours_offset + min_offset)
    #print stamp
    #print offset
    #print secs_offset
    form = '%a %d %B %Y %H:%M:%S'
    dt1 = datetime.strptime(stamp, form)
    delta1 = timedelta(seconds=secs_offset) 
    #print dt1 
    utc1 = dt1 + delta1;
    #print utc1
    
    ex2=raw_input().rstrip('\n')
    stamp2 = ' '.join(ex2.split()[0:5])
    offset2 = ex2.split()[5]
    hours_offset2 = int(offset2) / 100
    min_offset2 = int(offset2) % 10
    secs_offset2 = 60 * (60 * hours_offset2 + min_offset2)
    
    dt2 = datetime.strptime(stamp2, form)
    delta2 = timedelta(seconds=secs_offset2) 
    #print dt2
    utc2 = dt2 + delta2;
    #print utc2
    
    print abs(int((utc1 - utc2).total_seconds())) 

