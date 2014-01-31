get_filename_component(module_file_path ${CMAKE_CURRENT_LIST_FILE} PATH)
# Look for the header file.
find_path(SKIA_INCLUDE NAMES config/SkUserConfig.h PATHS ${SKIA_INCLUDE_DIR}/include  DOC "Path in which the file SKIA.h is located."      NO_DEFAULT_PATH NO_SYSTEM_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH )
mark_as_advanced(SKIA_INCLUDE)
# Look for the library.
# Does this work on UNIX systems? (LINUX)
find_library(SKIA_LIB_CORE NAMES skia_core PATHS ${SKIA_ROOT}/ $ENV{SKIA_ROOT}/ DOC "Path to SKIA library."  NO_DEFAULT_PATH NO_SYSTEM_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH)
mark_as_advanced(SKIA_LIB_CORE)
# Copy the results to the output variables.
if (SKIA_INCLUDE AND SKIA_LIB_CORE)
  find_library(SKIA_LIB_IMAGES NAMES skia_images PATHS ${SKIA_ROOT}/ $ENV{SKIA_ROOT}/ DOC "Path to SKIA library."  NO_DEFAULT_PATH NO_SYSTEM_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH)
  mark_as_advanced(SKIA_LIB_IMAGES)
  find_library(SKIA_LIB_SKGPU NAMES skia_skgpu PATHS ${SKIA_ROOT}/ $ENV{SKIA_ROOT}/ DOC "Path to SKIA library."  NO_DEFAULT_PATH NO_SYSTEM_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH)
  mark_as_advanced(SKIA_LIB_SKGPU)
  find_library(SKIA_LIB_OPTS NAMES skia_opts PATHS ${SKIA_ROOT}/ $ENV{SKIA_ROOT}/ DOC "Path to SKIA library."  NO_DEFAULT_PATH NO_SYSTEM_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH)
  mark_as_advanced(SKIA_LIB_OPTS)
  find_library(SKIA_LIB_OPTS3 NAMES skia_opts_ssse3 PATHS ${SKIA_ROOT}/ $ENV{SKIA_ROOT}/ DOC "Path to SKIA library."  NO_DEFAULT_PATH NO_SYSTEM_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH)
  mark_as_advanced(SKIA_LIB_OPTS3)
  find_library(SKIA_LIB_PORTS NAMES skia_ports PATHS ${SKIA_ROOT}/ $ENV{SKIA_ROOT}/ DOC "Path to SKIA library."  NO_DEFAULT_PATH NO_SYSTEM_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH)
  mark_as_advanced(SKIA_LIB_PORTS)


  SET(SKIA_LIBS ${SKIA_LIB_CORE} ${SKIA_LIB_UTILS}  ${SKIA_LIB_IMAGES} ${SKIA_LIB_SKGPU} ${SKIA_LIB_PORTS} ${SKIA_LIB_OPTS} ${SKIA_LIB_OPTS3} )
  mark_as_advanced(SKIA_LIBS)
  message(STATUS "Found SKIA in ${SKIA_INCLUDE} ${SKIA_LIBS}")
  set(SKIA_FOUND 1)
  include(CheckCXXSourceCompiles)
  set(CMAKE_REQUIRED_LIBRARIES ${SKIA_LIBS} pthread)

  else ()
   set(SKIA_FOUND 0)
   endif ()

   # Report the results.
   if (NOT SKIA_FOUND)
     set(SKIA_DIR_MESSAGE "SKIA was not found. Make sure SKIA_LIBS and SKIA_INCLUDE are set.")
     if (SKIA_FIND_REQUIRED)
       message(FATAL_ERROR "${SKIA_DIR_MESSAGE}")
       elseif (NOT SKIA_FIND_QUIETLY)
         message(STATUS "${SKIA_DIR_MESSAGE}")
         endif ()
         endif ()