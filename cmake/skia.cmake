SET(Skia_Base ${PROJECT_SOURCE_DIR}/deps/skia/out/Release/libskia_)
SET(Skia_LIBS ${Skia_Base}core.a ${Skia_Base}images.a ${Skia_Base}skgpu.a ${Skia_Base}ports.a ${Skia_Base}opts.a ${Skia_Base}opts_ssse3.a)

add_custom_command(
OUTPUT ${Skia_LIBS}
COMMAND gclient config --name . https://skia.googlesource.com/skia.git && gclient sync && ./gyp_skia && make skia_lib BUILDTYPE=Release
WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/deps/skia
)

add_custom_target(
skia_lib
DEPENDS  ${Skia_LIBS}
)