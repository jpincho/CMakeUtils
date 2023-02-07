include ( "Helpers" )

FindModuleStart( glm ALLOW_SYSTEM_LIBS )

#message ( STATUS "Searching for GLM header in ${GLM_INCLUDE_SEARCH_PATHS} with suffixes ${GLM_INCLUDE_SEARCH_PATH_SUFFIXES}")
#message ( STATUS "Searching for GLM library in ${GLM_LIBRARY_SEARCH_PATHS} with suffixes ${GLM_LIBRARY_SEARCH_PATH_SUFFIXES}")

find_path ( GLM_INCLUDE_DIR
    NAMES
        glm/glm.hpp
    PATH_SUFFIXES
        ${GLM_INCLUDE_SEARCH_PATH_SUFFIXES}
    PATHS
        ${CMAKE_INCLUDE_PATH}
        ${CMAKE_INSTALL_PREFIX}
        ${GLM_INCLUDE_SEARCH_PATHS}
    )

list ( APPEND GLM_INCLUDE_DIRS ${GLM_INCLUDE_DIR} )

include ( FindPackageHandleStandardArgs )
find_package_handle_standard_args ( glm DEFAULT_MSG GLM_INCLUDE_DIRS )
