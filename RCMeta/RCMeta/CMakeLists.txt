set(Boost_USE_STATIC_LIBS   ON)
find_package(Boost REQUIRED system filesystem date_time regex)
include_directories(${Boost_INCLUDE_DIRS})

source_group(Reader Reader/.*)

add_library(RCMeta STATIC
	RCMeta.h
	RCMeta.cpp
	RCMetaReader.h
	Reader/RCGitReader.h
	Reader/RCGitReader.cpp
	Reader/RCSubversionReader.h
	Reader/RCSubversionReader.cpp
)

target_link_libraries(RCMeta ${Boost_LIBRARIES})