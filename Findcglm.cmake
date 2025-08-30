include ( "Helpers" )

FindModuleStart( cglm ALLOW_SYSTEM_LIBS )

#message ( STATUS "Searching for CGLM header in ${CGLM_INCLUDE_SEARCH_PATHS} with suffixes ${CGLM_INCLUDE_SEARCH_PATH_SUFFIXES}")
#message ( STATUS "Searching for CGLM library in ${CGLM_LIBRARY_SEARCH_PATHS} with suffixes ${CGLM_LIBRARY_SEARCH_PATH_SUFFIXES}")

find_path ( CGLM_INCLUDE_DIR
    NAMES
        cglm/cglm.h
    PATH_SUFFIXES
        ${CGLM_INCLUDE_SEARCH_PATH_SUFFIXES}
    PATHS
        ${CMAKE_INCLUDE_PATH}
        ${CMAKE_INSTALL_PREFIX}
        ${CGLM_INCLUDE_SEARCH_PATHS}
    )

list ( APPEND CGLM_INCLUDE_DIRS ${CGLM_INCLUDE_DIR} )

include ( FindPackageHandleStandardArgs )
find_package_handle_standard_args ( cglm DEFAULT_MSG CGLM_INCLUDE_DIRS )
