# CMake Check that KLF_* options are valid
# ========================================
# $Id: klfinstallpaths.cmake 572 2010-11-27 12:52:43Z philippe $

set(klf_valid_cache_variables
  KLF_WELCOME_MSG_SILENT
  KLF_QT_VERSION
  KLF_BUILD_TOOLS
  KLF_BUILD_TOOLSDESPLUGIN
  KLF_BUILD_BACKEND
  KLF_BUILD_BACKEND_AUTO
  KLF_BUILD_GUI
  KLF_BUILD_PLUGINS
  KLF_LIBKLFTOOLS_STATIC
  KLF_LIBKLFBACKEND_STATIC
  KLF_LIBKLFBACKEND_AUTO_STATIC
  KLF_LIBKLFAPP_STATIC
  KLF_TARGET_ARCH_64
  KLF_ARCH_FLAGS
  KLF_LIB_SUFFIX
  KLF_USE_DBUS
  KLF_INCLUDE_FONTS
  KLF_NO_CMU_FONT
  KLF_USE_SPARKLE
  KLF_SPARKLE_FEED_URL
  KLF_SPARKLE_FRAMEWORK
  KLF_SPARKLE_DSA_PUBKEY
  KLF_USE_WINSPARKLE
  KLF_WINSPARKLE_FEED_URL
  KLF_WINSPARKLE_DIR
  KLF_BUILD_KTEXTEDITORPLUGIN
  KLF_INSTALL_LIB_DIR
  KLF_INSTALL_BIN_DIR
  KLF_INSTALL_DESPLUGIN_DIR
  KLF_INSTALL_KLFTOOLS_HEADERS
  KLF_INSTALL_KLFTOOLS_SO_LIBS
  KLF_INSTALL_KLFTOOLS_STATIC_LIBS
  KLF_INSTALL_KLFTOOLS_FRAMEWORK
  KLF_INSTALL_KLFTOOLSDESPLUGIN
  KLF_INSTALL_KLFBACKEND_HEADERS
  KLF_INSTALL_KLFBACKEND_SO_LIBS
  KLF_INSTALL_KLFBACKEND_STATIC_LIBS
  KLF_INSTALL_KLFBACKEND_FRAMEWORK
  KLF_INSTALL_KLFBACKEND_AUTO_SO_LIBS
  KLF_INSTALL_KLFBACKEND_AUTO_STATIC_LIBS
  KLF_INSTALL_KLFBACKEND_AUTO_FRAMEWORK
  KLF_INSTALL_KLFAPP_HEADERS
  KLF_INSTALL_KLFAPP_SO_LIBS
  KLF_INSTALL_KLFAPP_STATIC_LIBS
  KLF_INSTALL_KLFAPP_FRAMEWORK
  KLF_INSTALL_KLATEXFORMULA_BIN
  KLF_INSTALL_KLATEXFORMULA_CMDL
  KLF_INSTALL_KLATEXFORMULA_BUNDLE
  KLF_INSTALL_RUNTIME
  KLF_INSTALL_DEVEL
  KLF_INSTALL_DESKTOP
  KLF_INSTALL_DESKTOP_CATEGORIES
  KLF_INSTALL_DESKTOP_ICON
  KLF_INSTALL_SHARE_APPLICATIONS_DIR
  KLF_INSTALL_SHARE_MIME_PACKAGES_DIR
  KLF_INSTALL_SHARE_PIXMAPS_DIR
  KLF_INSTALL_ICON_THEME
  KLF_INSTALL_SHARE_MAN1_DIR
  KLF_INSTALL_RUN_POST_INSTALL
  KLF_INSTALL_POST_UPDATEMIMEDATABASE
  KLF_EXTRA_SEARCH_PATHS
  KLF_INSTALL_APIDOC_DIR
  # Advanced, non-advertized options or Internal cache variables
  KLF_CMAKE_OS
  KLF_CMAKE_ARCH
  KLF_DEBUG
  KLF_EXPERIMENTAL
  KLF_MACOSX_BUNDLES
  KLF_MACOSX_BUNDLE_EXTRAS
  KLF_MACOSX_BUNDLE_EXTRAS_klatexformula
  KLF_APPKIT
  KLF_QT_PLUGINS
  KLF_BUNDLE_QT_FRAMEWORKS
  KLF_BUNDLE_QT_PLUGINS
  KLF_LOCAL_QT_FRAMEWORKS
  KLF_LOCAL_QT_PLUGINS
  KLF_ROOT_CMAKE_READ
  KLF_USE_CPACK
  KLF_CMAKE_BASEPLUGINSSUBDIR
  KLF_CMAKE_DEBUG
  KLF_CMAKE_QTVERSION
  KLF_CMAKE_PATH_SEP
  KLF_DEBUG_USE_MODELTEST
  KLF_DEVEL_LOCAL_BASEPLUGINS_COPY
  KLF_INSTALL_LATEXDIST
  KLF_INSTALL_LATEXDIST_DIR
  KLF_INSTALL_PLUGINS
  KLF_INSTALL_RCCRESOURCES_DIR
  KLF_INSTALL_QTLIBS
  KLF_INSTALL_QTPLUGINS
  KLF_INSTALL_QTPLUGINS_DIR
  KLF_INSTALL_QTPLUGINS_LIST
  KLF_WIN_ICON
)

set(klf_obsolete_cache_variables
  KLF_USE_QT4
)

get_directory_property(klf_defined_cache_variables CACHE_VARIABLES)

#message(STATUS "Checking for unrecognized KLF_* cache variables")
foreach(varname ${klf_defined_cache_variables})
  if(varname MATCHES "^KLF_.*")
    # check for unrecognized and obsolete cache variables
    list(FIND klf_valid_cache_variables "${varname}" varname_valid_index)
    list(FIND klf_obsolete_cache_variables "${varname}" varname_obsolete_index)
    if(varname_valid_index EQUAL -1 AND varname_obsolete_index EQUAL -1)
      KLFNote("Variable ${varname} is defined in cache but not recognized.")
    elseif(NOT varname_obsolete_index EQUAL -1)
      KLFNote("Variable ${varname} is now obsolete. Its value will have no effect.")
    endif()
  endif(varname MATCHES "^KLF_.*")
endforeach(varname)
