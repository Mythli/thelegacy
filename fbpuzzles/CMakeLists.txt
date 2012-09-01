cmake_minimum_required(VERSION 2.8)
project(fb-carrerpuzzles)

set(Boost_USE_STATIC_LIBS   ON)
find_package(Boost REQUIRED)
include_directories(${Boost_INCLUDE_DIRS})

add_library(fbcarrerpuzzles STATIC
	Defines.h
	Puzzle.h
	Puzzle.cpp
)

add_subdirectory(hoppity)
add_subdirectory(meepmeep)
add_subdirectory(liarliar)
add_subdirectory(breathalyzer)