include ( "ExternalProject" )

# GLFW ############################################
ExternalProject_Add ( Install_glfw3
    GIT_REPOSITORY
        https://github.com/glfw/glfw
    GIT_TAG
        3.4
    GIT_SHALLOW 
        TRUE
    GIT_PROGRESS 
        TRUE
    UPDATE_COMMAND
        ""
    SOURCE_DIR
        ${CMAKE_BINARY_DIR}/Downloads/GLFW3
    INSTALL_DIR
        ${GLFW3_PATH}
    CMAKE_ARGS
        -DBUILD_SHARED_LIBS=FALSE
        -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
        -DGLFW_BUILD_EXAMPLES=FALSE
        -DGLFW_BUILD_TESTS=FALSE
        -DGLFW_BUILD_DOCS=FALSE
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        ${GLFW3_CMAKE_FLAGS}
    EXCLUDE_FROM_ALL
        TRUE
    )
