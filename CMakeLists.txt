cmake_minimum_required(VERSION 2.8.7)
project (swigHAPI  CXX)

SET(SWIGHAPI_VERSION_MAJOR 0)
SET(SWIGHAPI_VERSION_MINOR 1)
SET(SWIGHAPI_VERSION_PATCH 0)


#####################
#                   #
# FIND DEPENDENCIES #
#                   #
#####################
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

include(macroUtils)
include(macroDependencies)

find_package(HAPI)
set(EXTERNAL_LIBS_INCLUDE_DIRS    ${EXTERNAL_LIBS_INCLUDE_DIRS}     ${HAPI_INCLUDE_DIRS})
set(EXTERNAL_LIBRARIES            ${EXTERNAL_LIBRARIES}             ${HAPI_LIBRARIES})  

##############################
#                            #
# CONFIGURE BUILD PROPERTIES #
#                            #
##############################
## To add Debug feature add ";Debug" after Release on the line below
set(CMAKE_CONFIGURATION_TYPES "RelWithDebInfo;Release" CACHE STRING "Semicolon separated list of supported configuration types, only supports Debug, Release, MinSizeRel, and RelWithDebInfo, anything else will be ignored." FORCE )
set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Current configuration type" FORCE)

add_subdirectory(src)


##### END of CMakeLists.txt

