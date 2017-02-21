


import sys
sys.path.append("../../build/py/")

import pyHAPI

print "start"
hd = pyHAPI.AnyHapticsDevice()
render = pyHAPI.GodObjectRenderer()



if 1:

    hd.setHapticsRenderer( render )

    if hd.initDevice() != pyHAPI.HAPIHapticsDevice.SUCCESS:
        print "ERROR, Cannot initialize device"
        print "MESSAGE:", hd.getLastErrorMsg()
        exit()

    hd.enableDevice()


    print "init shape and add"
    surface = pyHAPI.FrictionSurface(5,0,0,0)
    sphereShape = pyHAPI.Sphere([0,0,0], 0.03 )
    my_haptic_sphere = pyHAPI.HapticPrimitive(sphereShape, surface, pyHAPI.FRONT)

    hd.addShape( my_haptic_sphere )

    hd.transferObjects()

    print "start control..."
    import time
    time.sleep(5)

    hd.disableDevice()

    hd.releaseDevice()

    print "END of SCRIPT, all went well"


