include ( "ExternalProject" )

# CGLM #####################################
ExternalProject_Add ( Install_cglm
    GIT_REPOSITORY
        https://github.com/recp/cglm
    GIT_SHALLOW
        TRUE
    SOURCE_DIR
        ${CMAKE_BINARY_DIR}/Downloads/cglm
    INSTALL_DIR
        ${GLM_PATH}
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        ${CGLM_CMAKE_FLAGS}
    EXCLUDE_FROM_ALL
        TRUE
    )
