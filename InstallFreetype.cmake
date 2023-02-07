include ( "ExternalProject" )

# FreeType #####################################
ExternalProject_Add ( Install_Freetype
    GIT_REPOSITORY
        https://gitlab.freedesktop.org/freetype/freetype
    GIT_TAG
        VER-2-10-4
    GIT_SHALLOW 
        TRUE
    SOURCE_DIR 
        ${CMAKE_BINARY_DIR}/Downloads/Freetype
    INSTALL_DIR
        ${FREETYPE_PATH}
    CMAKE_ARGS 
        -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> -DWITH_BZip2=OFF -DWITH_HarfBuzz=OFF
    UPDATE_COMMAND
        ""
    #DEPENDS
    #    ThirdParty_libPNG
    #-DWITH_BZIP2=OFF
    EXCLUDE_FROM_ALL
        TRUE
    )
