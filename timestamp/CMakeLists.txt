cmake_minimum_required(VERSION 3.15)
project(pxpa_timestamp C)

#include_directories(imgui/ imgui/backends/)
#target_link_libraries(pxpa_imgui d3d11.lib)

add_library(pxpa_timestamp SHARED main.c)

#set_property(TARGET pxpa_imgui PROPERTY
  #MSVC_RUNTIME_LIBRARY "MultiThreaded")

#set_target_properties(pxpa_imgui PROPERTIES COMPILE_OPTIONS "/D WIN32" LINK_FLAGS "/MACHINE:X86")