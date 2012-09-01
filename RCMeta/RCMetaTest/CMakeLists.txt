include_directories(AFTER ${PROJECT_SOURCE_DIR})

set(Boost_USE_STATIC_LIBS   ON)
find_package(Boost REQUIRED system filesystem date_time regex)
include_directories(${Boost_INCLUDE_DIRS})

add_executable(RCMetaTest Main.cpp)

target_link_libraries(RCMetaTest ${Boost_LIBRARIES})
target_link_libraries(RCMetaTest RCMeta)
add_dependencies(RCMetaTest RCMeta)
