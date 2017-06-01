# - Find HAPI
# Find the native HAPI headers and libraries.
#
#  HAPI_ROOT         - The HAPI root folder.
#  HAPI_INCLUDE_DIRS - where to find HAPI.h, etc.
#  HAPI_LIBRARIES    - List of libraries when using HAPI.
#  HAPI_EXTERNAL_DIR - where to find the include file of the external libraries.
#  HAPI_FOUND        - True if HAPI found.

GET_FILENAME_COMPONENT(module_file_path ${CMAKE_CURRENT_LIST_FILE} PATH )


# Look for the library.
IF( MSVC )
  SET( H3D_MSVC_VERSION 6 )
  SET( TEMP_MSVC_VERSION 1299 )
  WHILE( ${MSVC_VERSION} GREATER ${TEMP_MSVC_VERSION} )
    MATH( EXPR H3D_MSVC_VERSION "${H3D_MSVC_VERSION} + 1" )
    MATH( EXPR TEMP_MSVC_VERSION "${TEMP_MSVC_VERSION} + 100" )
  ENDWHILE( ${MSVC_VERSION} GREATER ${TEMP_MSVC_VERSION} )
  SET( HAPI_NAME "HAPI_vc${H3D_MSVC_VERSION}" )
  SET( H3DUTIL_NAME "H3DUtil_vc${H3D_MSVC_VERSION}" )
ELSE(MSVC)
  SET( HAPI_NAME "hapi" )
  SET( H3DUTIL_NAME "h3dutil" )
ENDIF( MSVC )


if("${CMAKE_GENERATOR}" MATCHES "(Win64|IA64)")
    SET(LIBTYPE "lib64")
else()
    SET(LIBTYPE "lib32")
endif()

# We look for the corresponding path by searching for the proper libraries
FIND_PATH(HAPI_ROOT
    NAMES lib/${HAPI_NAME}.lib ${LIBTYPE}/${HAPI_NAME}.lib  lib/lib${HAPI_NAME}.so ${LIBTYPE}/lib${HAPI_NAME}.so
    PATHS
        C:/HAPI
        $ENV{H3D_ROOT}
        $ENV{H3D_ROOT}/..
        ${module_file_path}/../../..
    DOC "Path to get the root folder of the HAPI library."
)


set(HAPI_LIBRARIES)
if (HAPI_ROOT) #if we found the proper library, then
    # Look for the header file.
    FIND_PATH(HAPI_INCLUDE_DIR NAMES HAPI/HAPI.h 
        PATHS ${HAPI_ROOT}
        PATH_SUFFIXES include HAPI/include
        DOC "Path in which the file HAPI/HAPI.h is located."
        NO_DEFAULT_PATH
    )
    FIND_PATH(H3DUTIL_INCLUDE_DIR NAMES H3DUtil/H3DUtil.h 
        PATHS ${HAPI_ROOT}
        PATH_SUFFIXES include H3DUtil/include
        DOC "Path in which the file H3DUtil/H3DUtil.h is located."
        NO_DEFAULT_PATH
    )
    
    
    # Look for libraries
    FIND_LIBRARY(HAPI_LIBRARY
        NAMES ${HAPI_NAME}
        PATHS ${HAPI_ROOT}
        PATH_SUFFIXES lib ${LIBTYPE}
        DOC "Path in which the file ${HAPI_NAME} is located."
        NO_DEFAULT_PATH
    )
    FIND_LIBRARY(HAPI_LIBRARY_DEBUG
        NAMES ${HAPI_NAME}_d
        PATHS ${HAPI_ROOT}
        PATH_SUFFIXES lib ${LIBTYPE}
        DOC "Path in which the file ${HAPI_NAME} debug is located."
        NO_DEFAULT_PATH
    )
    FIND_LIBRARY(H3DUTIL_LIBRARY
        NAMES ${H3DUTIL_NAME}
        PATHS ${HAPI_ROOT}
        PATH_SUFFIXES lib ${LIBTYPE}
        DOC "Path in which the file ${H3DUTIL_NAME} is located."
        NO_DEFAULT_PATH
    )
    FIND_LIBRARY(H3DUTIL_LIBRARY_DEBUG
        NAMES ${H3DUTIL_NAME}_d
        PATHS ${HAPI_ROOT}
        PATH_SUFFIXES lib ${LIBTYPE}
        DOC "Path in which the file ${H3DUTIL_NAME} debug is located."
        NO_DEFAULT_PATH
    )
    
    # check the debug possibilities of the libraries
    if(NOT HAPI_LIBRARY_DEBUG)
        list(APPEND HAPI_LIBRARIES optimized ${HAPI_LIBRARY} debug ${HAPI_LIBRARY})
    else()
        list(APPEND HAPI_LIBRARIES optimized ${HAPI_LIBRARY} debug ${HAPI_LIBRARY_DEBUG})
    endif()
    
    if(NOT H3DUTIL_LIBRARY_DEBUG)
        list(APPEND HAPI_LIBRARIES optimized ${H3DUTIL_LIBRARY} debug ${H3DUTIL_LIBRARY})
    else()
        list(APPEND HAPI_LIBRARIES optimized ${H3DUTIL_LIBRARY} debug ${H3DUTIL_LIBRARY_DEBUG})
    endif()
else()
    set(HAPI_INCLUDE_DIR    HAPI_INCLUDE_DIR-NOTFOUND)
    set(H3DUTIL_INCLUDE_DIR H3DUTIL_INCLUDE_DIR-NOTFOUND)
    set(HAPI_LIBRARY HAPI_LIBRARY-NOTFOUND)
    set(HAPI_LIBRARY_DEBUG HAPI_LIBRARY_DEBUG-NOTFOUND)
    set(H3DUTIL_LIBRARY H3DUTIL_LIBRARY-NOTFOUND)
    set(H3DUTIL_LIBRARY_DEBUG H3DUTIL_LIBRARY_DEBUG-NOTFOUND)
endif()

MARK_AS_ADVANCED(HAPI_INCLUDE_DIR)
MARK_AS_ADVANCED(H3DUTIL_INCLUDE_DIR)
MARK_AS_ADVANCED(HAPI_LIBRARY)
MARK_AS_ADVANCED(HAPI_LIBRARY_DEBUG)
MARK_AS_ADVANCED(H3DUTIL_LIBRARY)
MARK_AS_ADVANCED(H3DUTIL_LIBRARY_DEBUG)

set(HAPI_INCLUDE_DIRS   ${HAPI_INCLUDE_DIR}   ${H3DUTIL_INCLUDE_DIR}   "${HAPI_ROOT}/External/include/pthread")
set(HAPI_EXTERNAL_DIR ${HAPI_ROOT}/External)


#message(STATUS "HAPI_ROOT::: ${HAPI_ROOT}")
#message(STATUS "HAPI_NAME::: ${HAPI_NAME}")
#message(STATUS "HAPI_LIBRARIES::: ${HAPI_LIBRARIES}")
#message(STATUS "HAPI_INCLUDE_DIRS::: ${HAPI_INCLUDE_DIRS}")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(HAPI  DEFAULT_MSG   HAPI_LIBRARIES   HAPI_INCLUDE_DIRS)






