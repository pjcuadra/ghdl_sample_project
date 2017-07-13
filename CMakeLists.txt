# Copyright 2017 Pedro Cuadra <pjcuadra@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Define project
project(ghdl_sample_project)

# Define required cmake version
cmake_minimum_required(VERSION 2.8)

# Include macros
include(cmake/macros.cmake)
include(cmake/test_macros.cmake)

# Enable testing
enable_testing()

add_custom_target(check COMMAND ${CMAKE_CTEST_COMMAND})

# Parse all sources
add_subdirectory(src/)
# Create all tests
add_subdirectory(test/)

add_custom_target(index ALL COMMAND ghdl -i --workdir=${CMAKE_CURRENT_BINARY_DIR} ${VHDL_SOURCES})

# Add compile test target
set(CTEST_OUTPUT_ON_FAILURE 1)

# Find pthread (need for testing)
# find_package (Threads)

# Compile all tests
# add_all_tests(test/src/)

# Create placeholder for wave traces
# file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/trace/")
# message("-- Placeholder for trace files created at: ${CMAKE_CURRENT_BINARY_DIR}/trace/")
