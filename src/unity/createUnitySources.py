
import sys
import os
import shutil
import glob

def copyFiles(src, dest, extension):
    files = glob.iglob(os.path.join(src, "*."+extension))
    for file in files:
        if os.path.isfile(file):
            shutil.copy2(file, dest)


print "Start creating unity source package"

print sys.argv
thisFilePath, buildDir, csHAPIDir, currentSrcDir = sys.argv

#create unity folder
unitySrcDir = os.path.join(currentSrcDir, "unity")
unityBinDir = os.path.join(buildDir     , "unity")
if os.path.exists(unityBinDir):
    shutil.rmtree(unityBinDir)

shutil.copytree(unitySrcDir, unityBinDir)

unitycsHAPIScrpitDir = os.path.join(unityBinDir, "csHAPI", "Scripts")
unityPluginsDir      = os.path.join(unityBinDir, "Plugins")

copyFiles(csHAPIDir, unitycsHAPIScrpitDir, "cs")
copyFiles(csHAPIDir, unityPluginsDir, "dll")


print "End creating unity source package"
