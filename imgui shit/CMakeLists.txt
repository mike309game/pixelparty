cmake_minimum_required(VERSION 3.15)
project(pxpa_imgui C CXX)

include_directories(imgui/ imgui/backends/)
#target_link_libraries(pxpa_imgui d3d11.lib)

add_library(pxpa_imgui SHARED imgui/backends/imgui_impl_dx11.cpp imgui/backends/imgui_impl_win32.cpp main.cpp imgui/imgui.cpp imgui/imgui_demo.cpp imgui/imgui_draw.cpp imgui/imgui_tables.cpp imgui/imgui_widgets.cpp)

#set_property(TARGET pxpa_imgui PROPERTY
  #MSVC_RUNTIME_LIBRARY "MultiThreaded")

#set_target_properties(pxpa_imgui PROPERTIES COMPILE_OPTIONS "/D WIN32" LINK_FLAGS "/MACHINE:X86")