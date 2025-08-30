cmake_minimum_required ( VERSION 3.10 )

# Macros for finding and installing packages

# make sure this module is only included once per project
if ( NOT LOCAL_PACKAGE_FIRST_PROJECT )
    set ( LOCAL_CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR} CACHE STRING "Location for LocalPackage to find CMake modules" )
    set ( LOCAL_PACKAGE_FIRST_PROJECT ${PROJECT_NAME} CACHE INTERNAL "" )
    set ( LOCAL_PACKAGE_INSTALL_LOCATION "${CMAKE_BINARY_DIR}/Dependencies" CACHE INTERNAL "Location where to search and install all local packages")
    set ( LOCAL_PACKAGE_USE_SYSTEM TRUE CACHE INTERNAL "Allow system packages to be used" )
    option ( LOCAL_PACKAGE_USE_SYSTEM "Allow system packages to be used" TRUE )
endif()

#message ( STATUS "Master - ${LOCAL_PACKAGE_FIRST_PROJECT} Current - ${PROJECT_NAME} CMake modules - ${LOCAL_CMAKE_MODULE_PATH} Install - ${LOCAL_PACKAGE_INSTALL_LOCATION}")

function ( set_local_package_install_location NEW_PACKAGE_INSTALL_LOCATION )
    if ( "${PROJECT_NAME}" STREQUAL "${LOCAL_PACKAGE_FIRST_PROJECT}" )
        message ( STATUS "Setting local package install location to ${NEW_PACKAGE_INSTALL_LOCATION}" )
        set ( LOCAL_PACKAGE_INSTALL_LOCATION "${NEW_PACKAGE_INSTALL_LOCATION}" CACHE INTERNAL "Location where to search and install all local packages")
    endif()
endfunction()

macro ( find_local_package )
    if ( NOT ${LOCAL_CMAKE_MODULE_PATH} IN_LIST CMAKE_MODULE_PATH )
        list ( APPEND CMAKE_MODULE_PATH ${LOCAL_CMAKE_MODULE_PATH} )
    endif()

    if ( NOT ${LOCAL_PACKAGE_INSTALL_LOCATION} IN_LIST CMAKE_FIND_ROOT_PATH )
        list ( APPEND CMAKE_FIND_ROOT_PATH ${LOCAL_PACKAGE_INSTALL_LOCATION} )
    endif()
    if ( NOT LOCAL_PACKAGE_ALLOW_SYSTEM )
        set ( OLD_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${CMAKE_FIND_ROOT_PATH_MODE_LIBRARY} )
        set ( OLD_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${CMAKE_FIND_ROOT_PATH_MODE_INCLUDE} )
        set ( OLD_CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ${CMAKE_FIND_ROOT_PATH_MODE_PACKAGE} )
        set ( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
        set ( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
        set ( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
    endif()
    find_package ( ${ARGN} )
    if ( NOT LOCAL_PACKAGE_ALLOW_SYSTEM )
        # Before proceeding, restore cmake search logic
        set ( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${OLD_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY} )
        set ( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${OLD_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE} )
        set ( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ${OLD_CMAKE_FIND_ROOT_PATH_MODE_PACKAGE} )
    endif()
endmacro()

function ( install_local_package PACKAGE_NAME )
    if ( TARGET "Install_${PACKAGE_NAME}" )
        return()
    endif()
    message ( STATUS "Marking ${PACKAGE_NAME} for installation")

    # In case I want to specify a custom install path for this dependency I can use this. Also specifies the default installation path for it
    string ( TOUPPER ${PACKAGE_NAME} UPPERCASE_PACKAGE_NAME )
    set ( ${UPPERCASE_PACKAGE_NAME}_PATH ${LOCAL_PACKAGE_INSTALL_LOCATION} CACHE INTERNAL "Location where to install ${PACKAGE_NAME}" )
    include ( Install${PACKAGE_NAME} )

    # Append to an existing target, or create a new one
    if ( TARGET BuildLocalPackages )
        add_dependencies ( BuildLocalPackages Install_${PACKAGE_NAME} )
    else()
        add_custom_target ( BuildLocalPackages ALL DEPENDS Install_${PACKAGE_NAME} )
    endif()
endfunction()

macro ( install_local_packages )
    if ( TARGET BuildLocalPackages )
        if ( "${PROJECT_NAME}" STREQUAL "${LOCAL_PACKAGE_FIRST_PROJECT}" )
            message ( STATUS "Installing local packages..." )
        endif()
        return()
    endif()
endmacro()
