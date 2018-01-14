import sys
sys.path.append("/usr/local/lib/python2.7/site-packages/")

import math
from playerc import *

# Create a client object
c = playerc_client(None, 'rockrobo', 6665)
# Connect it
if c.connect() != 0:
        print("Can't connect")
        sys.exit(0)

p = playerc_position2d(c,0)
if p.subscribe(PLAYERC_OPEN_MODE) != 0:
        print("Can't subscribe")
        sys.exit(0)

c.read()
print(p.px,p.py)
