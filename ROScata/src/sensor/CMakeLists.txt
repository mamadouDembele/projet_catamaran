cmake_minimum_required(VERSION 2.8.3)
project(sensor)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

############
## Catkin ##
############

find_package(catkin REQUIRED COMPONENTS
  roscpp
  sensor_msgs
  message_generation
)

# PKG_CONFIG_PATH
find_package(PkgConfig)
set(ENV{PKG_CONFIG_PATH}  "/usr/local/lib/pkgconfig:$ENV{PKG_CONFIG_PATH}")
set(CMAKE_PREFIX_PATH "/usr/local/lib/pkgconfig:${CMAKE_SOURCE_DIR}")
pkg_check_modules(LIBGPS REQUIRED libgps>=3.16)
message("libgps version = " ${LIBGPS_VERSION})
message("libgps include_dir = " ${LIBGPS_INCLUDEDIR})
message("libgps lib_dir = " ${LIBGPS_LIBDIR})
message("libgps libraries = " ${LIBGPS_LIBRARIES})

message("PKG_CONFIG_PATH = " $ENV{PKG_CONFIG_PATH})

#######################################
## Declare ROS messages and services ##
#######################################

add_message_files(
  FILES
    GPSFix.msg
    GnssPose.msg
)

generate_messages(DEPENDENCIES 
  std_msgs
)

###################################################
## Declare things to be passed to other projects ##
###################################################

catkin_package(
INCLUDE_DIRS include
  CATKIN_DEPENDS 
    message_runtime
    ${DEPS}
)

###########
## Build ##
###########

include_directories(
    include
    ${catkin_INCLUDE_DIRS}
    ${LIBGPS_INCLUDE_DIRS}
)
## Declare a C++ library
# add_library(${PROJECT_NAME}
#   src/${PROJECT_NAME}/sensor.cpp
# )

## Add cmake target dependencies of the library
## as an example, code may need to be generated before libraries
## either from message generation or dynamic reconfigure
# add_dependencies(${PROJECT_NAME} ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Declare a C++ executable
## With catkin_make all packages are built within a single CMake context
## The recommended prefix ensures that target names across packages don't collide
# add_executable(${PROJECT_NAME}_node src/sensor_node.cpp)
add_executable(node_boussole src/NodeBoussole.cpp)
add_executable(node_imu src/NodeIMU.cpp)
add_executable(node_gps src/NodeGPS.cpp src/client.cpp)
add_executable(node_gps_cartesien src/NodeConvertGPS.cpp)
## Rename C++ executable without prefix
## The above recommended prefix causes long target names, the following renames the
## target back to the shorter version for ease of user use
## e.g. "rosrun someones_pkg node" instead of "rosrun someones_pkg someones_pkg_node"
# set_target_properties(${PROJECT_NAME}_node PROPERTIES OUTPUT_NAME node PREFIX "")

## Add cmake target dependencies of the executable
## same as for the library above
# add_dependencies(${PROJECT_NAME}_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
# add_dependencies(${PROJECT_NAME} ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
add_dependencies(node_gps_cartesien ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
add_dependencies(node_gps ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
## Specify libraries to link a library or executable target against
# target_link_libraries(${PROJECT_NAME}_node
#   ${catkin_LIBRARIES}
# )
target_link_libraries(node_boussole ${catkin_LIBRARIES})
target_link_libraries(node_imu ${catkin_LIBRARIES})
target_link_libraries(node_gps ${catkin_LIBRARIES} ${LIBGPS_LIBRARIES})
target_link_libraries(node_gps_cartesien ${catkin_LIBRARIES} ${LIBGPS_LIBRARIE} proj)

#############
## Install ##
#############

# all install targets should use catkin DESTINATION variables
# See http://ros.org/doc/api/catkin/html/adv_user_guide/variables.html

## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
# install(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark executables for installation
## See http://docs.ros.org/melodic/api/catkin/html/howto/format1/building_executables.html
# install(TARGETS ${PROJECT_NAME}_node
#   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark libraries for installation
## See http://docs.ros.org/melodic/api/catkin/html/howto/format1/building_libraries.html
# install(TARGETS ${PROJECT_NAME}
#   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   RUNTIME DESTINATION ${CATKIN_GLOBAL_BIN_DESTINATION}
# )

## Mark cpp header files for installation
# install(DIRECTORY include/${PROJECT_NAME}/
#   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
#   FILES_MATCHING PATTERN "*.h"
#   PATTERN ".svn" EXCLUDE
# )

## Mark other files for installation (e.g. launch and bag files, etc.)
# install(FILES
#   # myfile1
#   # myfile2
#   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
# )

#############
## Testing ##
#############

## Add gtest based cpp test target and link libraries
# catkin_add_gtest(${PROJECT_NAME}-test test/test_sensor.cpp)
# if(TARGET ${PROJECT_NAME}-test)
#   target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME})
# endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)
