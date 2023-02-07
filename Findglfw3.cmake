include ( "Helpers" )

FindModuleStart( glfw3 ALLOW_SYSTEM_LIBS )

#message ( STATUS "Searching for GLFW3 header in ${GLFW3_INCLUDE_SEARCH_PATHS} with suffixes ${GLFW3_INCLUDE_SEARCH_PATH_SUFFIXES}")
#message ( STATUS "Searching for GLFW3 library in ${GLFW3_LIBRARY_SEARCH_PATHS} with suffixes ${GLFW3_LIBRARY_SEARCH_PATH_SUFFIXES}")

find_path ( GLFW3_INCLUDE_DIR
    NAMES
        GLFW/glfw3.h
    PATH_SUFFIXES
        ${GLFW3_INCLUDE_SEARCH_PATH_SUFFIXES}
    PATHS
        ${CMAKE_INCLUDE_PATH}
        ${CMAKE_INSTALL_PREFIX}
        ${GLFW3_INCLUDE_SEARCH_PATHS}
    )

find_library ( GLFW3_LIBRARY
    NAMES
        glfw3
        ${GLFW3_LIBRARY_NAMES}
    PATH_SUFFIXES
        ${GLFW3_LIBRARY_SEARCH_PATH_SUFFIXES}
    PATHS
        ${CMAKE_LIBRARY_PATH}
        ${CMAKE_INSTALL_PREFIX}
        ${GLFW3_LIBRARY_SEARCH_PATHS}
    )
list ( APPEND GLFW3_INCLUDE_DIRS ${GLFW3_INCLUDE_DIR} )
list ( APPEND GLFW3_LIBRARIES ${GLFW3_LIBRARY} )

include ( FindPackageHandleStandardArgs )
find_package_handle_standard_args ( glfw3 DEFAULT_MSG GLFW3_LIBRARIES GLFW3_INCLUDE_DIRS )
