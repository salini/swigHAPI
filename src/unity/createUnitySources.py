
import sys
import os
import shutil
import glob

def copyFiles(src, dest, extension):
    files = glob.iglob(os.path.join(src, "*."+extension))
    for file in files:
        #print file
        if os.path.isfile(file):
            shutil.copy2(file, dest)


print "Start creating unity source package"

print sys.argv
thisFilePath, buildDir, csHAPIDir, currentSrcDir = sys.argv

#create unity folder
unitySrcDir = os.path.join(currentSrcDir, "unity")
unityBinDir = os.path.join(buildDir     , "unity")
unitycsHAPIScriptDir = os.path.join(unityBinDir, "csHAPI", "Scripts")
unityPluginsDir      = os.path.join(unityBinDir, "Plugins")

#print "unitySrcDir", unitySrcDir
#print "unityBinDir", unityBinDir
#print "unitycsHAPIScriptDir", unitycsHAPIScriptDir
#print "unityPluginsDir", unityPluginsDir

if os.path.exists(unityBinDir):
    shutil.rmtree(unityBinDir)

shutil.copytree(unitySrcDir, unityBinDir)
os.makedirs(unitycsHAPIScriptDir)
os.makedirs(unityPluginsDir)

copyFiles(csHAPIDir, unitycsHAPIScriptDir, "cs")
copyFiles(csHAPIDir, unityPluginsDir, "dll")


print "End creating unity source package"
