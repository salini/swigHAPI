
import sys
sys.path.append("../../build/py/")

import pyHAPI

print "start"
hd = pyHAPI.AnyHapticsDevice()
render = pyHAPI.GodObjectRenderer()

hd.setHapticsRenderer( render )


print "init shape and add"
surface = pyHAPI.FrictionSurface(5,0,0,0)
sphereShape = pyHAPI.Sphere([0,0,0], 0.03 )
my_haptic_sphere = pyHAPI.HapticPrimitive(sphereShape, surface, pyHAPI.FRONT)

hd.addShape( my_haptic_sphere )

hd.transferObjects()


print "END of SCRIPT, all went well"


