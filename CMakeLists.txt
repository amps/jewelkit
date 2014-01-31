cmake_minimum_required (VERSION 2.6)
SET(PROJECT_NAME jewelkit)
project (${PROJECT_NAME} CXX C)

list ( APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake )
add_subdirectory(deps)
add_subdirectory(lib)