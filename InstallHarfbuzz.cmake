include ( "ExternalProject" )

# HarfBuzz #####################################
ExternalProject_Add ( Install_Harfbuzz
    GIT_REPOSITORY
        https://github.com/harfbuzz/harfbuzz
    GIT_TAG
        2.7.4
    GIT_SHALLOW 
        TRUE
    SOURCE_DIR 
        ${CMAKE_BINARY_DIR}/Downloads/Harfbuzz
    INSTALL_DIR
        ${HARFBUZZ_PATH}
    CMAKE_ARGS 
        -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    UPDATE_COMMAND
        ""
    EXCLUDE_FROM_ALL
        TRUE
    )

    if ( TARGET Install_Freetype )
        add_dependencies ( Install_Harfbuzz Install_Freetype )
    endif()
