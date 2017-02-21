
import sys
sys.path.append("../../build/py/")

import pyHAPI

try:
    rfc = pyHAPI.RefCountedClass()
except AttributeError:
    pass


eo = pyHAPI.EffectOutput([9,8,7])
print eo.getForce()

eo.setForce([1,2,3])
print eo.getForce()

eoo = pyHAPI.EffectOutput([1,2,3])
ee = eo + eoo
print ee.getForce()
ee = ee* 0.5
print ee.getForce()


dv = pyHAPI.DeviceValues()

try:
    eo = pyHAPI.EffectOutput(1,3,7,8,9)
except NotImplementedError:
    pass


