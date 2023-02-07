include ( "Helpers" )

FindModuleStart( Harfbuzz ALLOW_SYSTEM_LIBS )

#message ( STATUS "Searching for Harfbuzz header in ${HARFBUZZ_INCLUDE_SEARCH_PATHS} with suffixes ${HARFBUZZ_INCLUDE_SEARCH_PATH_SUFFIXES}")
#message ( STATUS "Searching for Harfbuzz library in ${HARFBUZZ_LIBRARY_SEARCH_PATHS} with suffixes ${HARFBUZZ_LIBRARY_SEARCH_PATH_SUFFIXES}")

find_path ( HARFBUZZ_INCLUDE_DIR
    NAMES
        harfbuzz/hb.h
    PATH_SUFFIXES
        ${HARFBUZZ_INCLUDE_SEARCH_PATH_SUFFIXES}
    PATHS
        ${CMAKE_INCLUDE_PATH}
        ${CMAKE_INSTALL_PREFIX}
        ${HARFBUZZ_INCLUDE_SEARCH_PATHS}
    )

find_library ( HARFBUZZ_LIBRARY
    NAMES
        harfbuzz
        ${HARFBUZZ_LIBRARY_NAMES}
    PATH_SUFFIXES
        ${HARFBUZZ_LIBRARY_SEARCH_PATH_SUFFIXES}
    PATHS
        ${CMAKE_LIBRARY_PATH}
        ${CMAKE_INSTALL_PREFIX}
        ${HARFBUZZ_LIBRARY_SEARCH_PATHS}
    )

#message ( STATUS "FindHarfbuzz.cmake - HARFBUZZ_LIBRARY - ${HARFBUZZ_LIBRARY}")
#message ( STATUS "FindHarfbuzz.cmake - HARFBUZZ_INCLUDE_DIR - ${HARFBUZZ_INCLUDE_DIR}")

list ( APPEND HARFBUZZ_INCLUDE_DIRS ${HARFBUZZ_INCLUDE_DIR} )
list ( APPEND HARFBUZZ_LIBRARIES ${HARFBUZZ_LIBRARY} )

include ( FindPackageHandleStandardArgs )
find_package_handle_standard_args ( Harfbuzz DEFAULT_MSG HARFBUZZ_LIBRARIES HARFBUZZ_INCLUDE_DIRS )
