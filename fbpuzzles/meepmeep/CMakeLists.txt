SET(CMAKE_BUILD_TYPE DEBUG)

add_executable(meepmeep
	Puzzle.h
	Main.cpp
)

target_link_libraries(meepmeep ${Boost_LIBRARIES})
target_link_libraries(meepmeep fbcarrerpuzzles)
add_dependencies(meepmeep fbcarrerpuzzles)