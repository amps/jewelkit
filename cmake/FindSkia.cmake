get_filename_component(module_file_path ${CMAKE_CURRENT_LIST_FILE} PATH)
# Look for the header file.
find_path(Skia_INCLUDE NAMES config/SkUserConfig.h PATHS ${Skia_INCLUDE_DIR}/include  DOC "Path in which the file Skia.h is located."      NO_DEFAULT_PATH NO_SYSTEM_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH )
mark_as_advanced(Skia_INCLUDE)
# Look for the library.
# Does this work on UNIX systems? (LINUX)
find_library(Skia_LIB_CORE NAMES skia_core PATHS ${Skia_ROOT}/ $ENV{Skia_ROOT}/ DOC "Path to Skia library."  NO_DEFAULT_PATH NO_SYSTEM_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH)
mark_as_advanced(Skia_LIB_CORE)
# Copy the results to the output variables.
if (Skia_INCLUDE AND Skia_LIB_CORE)
  find_library(Skia_LIB_IMAGES NAMES skia_images PATHS ${Skia_ROOT}/ $ENV{Skia_ROOT}/ DOC "Path to Skia library."  NO_DEFAULT_PATH NO_SYSTEM_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH)
  mark_as_advanced(Skia_LIB_IMAGES)
  find_library(Skia_LIB_SKGPU NAMES skia_skgpu PATHS ${Skia_ROOT}/ $ENV{Skia_ROOT}/ DOC "Path to Skia library."  NO_DEFAULT_PATH NO_SYSTEM_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH)
  mark_as_advanced(Skia_LIB_SKGPU)
  find_library(Skia_LIB_OPTS NAMES skia_opts PATHS ${Skia_ROOT}/ $ENV{Skia_ROOT}/ DOC "Path to Skia library."  NO_DEFAULT_PATH NO_SYSTEM_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH)
  mark_as_advanced(Skia_LIB_OPTS)
  find_library(Skia_LIB_OPTS3 NAMES skia_opts_ssse3 PATHS ${Skia_ROOT}/ $ENV{Skia_ROOT}/ DOC "Path to Skia library."  NO_DEFAULT_PATH NO_SYSTEM_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH)
  mark_as_advanced(Skia_LIB_OPTS3)
  find_library(Skia_LIB_PORTS NAMES skia_ports PATHS ${Skia_ROOT}/ $ENV{Skia_ROOT}/ DOC "Path to Skia library."  NO_DEFAULT_PATH NO_SYSTEM_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH)
  mark_as_advanced(Skia_LIB_PORTS)


  SET(Skia_LIBS ${Skia_LIB_CORE} ${Skia_LIB_UTILS}  ${Skia_LIB_IMAGES} ${Skia_LIB_SKGPU} ${Skia_LIB_PORTS} ${Skia_LIB_OPTS} ${Skia_LIB_OPTS3} )
  mark_as_advanced(Skia_LIBS)
  message(STATUS "Found Skia in ${Skia_INCLUDE} ${Skia_LIBS}")
  set(Skia_FOUND 1)
  include(CheckCXXSourceCompiles)
  set(CMAKE_REQUIRED_LIBRARIES ${Skia_LIBS} pthread)

  else ()
   set(Skia_FOUND 0)
   endif ()

   # Report the results.
   if (NOT Skia_FOUND)
     set(Skia_DIR_MESSAGE "Skia was not found. Make sure Skia_LIBS and Skia_INCLUDE are set.")
     if (Skia_FIND_REQUIRED)
       message(FATAL_ERROR "${Skia_DIR_MESSAGE}")
       elseif (NOT Skia_FIND_QUIETLY)
         message(STATUS "${Skia_DIR_MESSAGE}")
         endif ()
         endif ()