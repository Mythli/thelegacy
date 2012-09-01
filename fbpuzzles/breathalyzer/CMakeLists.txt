add_executable(breathalyzer
	Puzzle.h
	Puzzle.cpp
	Main.cpp
)

target_link_libraries(breathalyzer ${Boost_LIBRARIES})
target_link_libraries(breathalyzer fbcarrerpuzzles)
add_dependencies(breathalyzer fbcarrerpuzzles)
