
FIND_PACKAGE(PythonLibs)

get_target_property(CSHAPI_OUTPUT_DIR csHAPI  LIBRARY_OUTPUT_DIRECTORY_RELEASE)
add_custom_target( createUnitySources
    COMMAND ${PYTHON_EXECUTABLE} "createUnitySources.py" ${CMAKE_BINARY_DIR} ${CSHAPI_OUTPUT_DIR} ${CMAKE_CURRENT_SOURCE_DIR}
    DEPENDS csHAPI
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    COMMENT "regroup all useful code in the same folder that can then be used in Unity3D"
)