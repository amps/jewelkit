add_custom_command(
OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/skia/out/Release/libskia_core.a
COMMAND make skia_lib BUILDTYPE=Release
WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/skia
)

add_custom_target(
skia_lib
DEPENDS  ${CMAKE_CURRENT_SOURCE_DIR}/skia/out/Release/libskia_core.a
)