# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/jame/clion-2016.3/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/jame/clion-2016.3/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jame/share_user/git_leveldb

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jame/share_user/git_leveldb

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/home/jame/clion-2016.3/bin/cmake/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/home/jame/clion-2016.3/bin/cmake/bin/cmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/jame/share_user/git_leveldb/CMakeFiles /home/jame/share_user/git_leveldb/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/jame/share_user/git_leveldb/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named leveldb_example

# Build rule for target.
leveldb_example: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 leveldb_example
.PHONY : leveldb_example

# fast build rule for target.
leveldb_example/fast:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/build
.PHONY : leveldb_example/fast

easylogger/elog.o: easylogger/elog.c.o

.PHONY : easylogger/elog.o

# target to build an object file
easylogger/elog.c.o:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/easylogger/elog.c.o
.PHONY : easylogger/elog.c.o

easylogger/elog.i: easylogger/elog.c.i

.PHONY : easylogger/elog.i

# target to preprocess a source file
easylogger/elog.c.i:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/easylogger/elog.c.i
.PHONY : easylogger/elog.c.i

easylogger/elog.s: easylogger/elog.c.s

.PHONY : easylogger/elog.s

# target to generate assembly for a file
easylogger/elog.c.s:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/easylogger/elog.c.s
.PHONY : easylogger/elog.c.s

easylogger/elog_port.o: easylogger/elog_port.c.o

.PHONY : easylogger/elog_port.o

# target to build an object file
easylogger/elog_port.c.o:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/easylogger/elog_port.c.o
.PHONY : easylogger/elog_port.c.o

easylogger/elog_port.i: easylogger/elog_port.c.i

.PHONY : easylogger/elog_port.i

# target to preprocess a source file
easylogger/elog_port.c.i:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/easylogger/elog_port.c.i
.PHONY : easylogger/elog_port.c.i

easylogger/elog_port.s: easylogger/elog_port.c.s

.PHONY : easylogger/elog_port.s

# target to generate assembly for a file
easylogger/elog_port.c.s:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/easylogger/elog_port.c.s
.PHONY : easylogger/elog_port.c.s

easylogger/elog_utils.o: easylogger/elog_utils.c.o

.PHONY : easylogger/elog_utils.o

# target to build an object file
easylogger/elog_utils.c.o:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/easylogger/elog_utils.c.o
.PHONY : easylogger/elog_utils.c.o

easylogger/elog_utils.i: easylogger/elog_utils.c.i

.PHONY : easylogger/elog_utils.i

# target to preprocess a source file
easylogger/elog_utils.c.i:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/easylogger/elog_utils.c.i
.PHONY : easylogger/elog_utils.c.i

easylogger/elog_utils.s: easylogger/elog_utils.c.s

.PHONY : easylogger/elog_utils.s

# target to generate assembly for a file
easylogger/elog_utils.c.s:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/easylogger/elog_utils.c.s
.PHONY : easylogger/elog_utils.c.s

easylogger/log.o: easylogger/log.cpp.o

.PHONY : easylogger/log.o

# target to build an object file
easylogger/log.cpp.o:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/easylogger/log.cpp.o
.PHONY : easylogger/log.cpp.o

easylogger/log.i: easylogger/log.cpp.i

.PHONY : easylogger/log.i

# target to preprocess a source file
easylogger/log.cpp.i:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/easylogger/log.cpp.i
.PHONY : easylogger/log.cpp.i

easylogger/log.s: easylogger/log.cpp.s

.PHONY : easylogger/log.s

# target to generate assembly for a file
easylogger/log.cpp.s:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/easylogger/log.cpp.s
.PHONY : easylogger/log.cpp.s

main.o: main.cpp.o

.PHONY : main.o

# target to build an object file
main.cpp.o:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/main.cpp.o
.PHONY : main.cpp.o

main.i: main.cpp.i

.PHONY : main.i

# target to preprocess a source file
main.cpp.i:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/main.cpp.i
.PHONY : main.cpp.i

main.s: main.cpp.s

.PHONY : main.s

# target to generate assembly for a file
main.cpp.s:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/main.cpp.s
.PHONY : main.cpp.s

src/unqlite.o: src/unqlite.c.o

.PHONY : src/unqlite.o

# target to build an object file
src/unqlite.c.o:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/src/unqlite.c.o
.PHONY : src/unqlite.c.o

src/unqlite.i: src/unqlite.c.i

.PHONY : src/unqlite.i

# target to preprocess a source file
src/unqlite.c.i:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/src/unqlite.c.i
.PHONY : src/unqlite.c.i

src/unqlite.s: src/unqlite.c.s

.PHONY : src/unqlite.s

# target to generate assembly for a file
src/unqlite.c.s:
	$(MAKE) -f CMakeFiles/leveldb_example.dir/build.make CMakeFiles/leveldb_example.dir/src/unqlite.c.s
.PHONY : src/unqlite.c.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... leveldb_example"
	@echo "... easylogger/elog.o"
	@echo "... easylogger/elog.i"
	@echo "... easylogger/elog.s"
	@echo "... easylogger/elog_port.o"
	@echo "... easylogger/elog_port.i"
	@echo "... easylogger/elog_port.s"
	@echo "... easylogger/elog_utils.o"
	@echo "... easylogger/elog_utils.i"
	@echo "... easylogger/elog_utils.s"
	@echo "... easylogger/log.o"
	@echo "... easylogger/log.i"
	@echo "... easylogger/log.s"
	@echo "... main.o"
	@echo "... main.i"
	@echo "... main.s"
	@echo "... src/unqlite.o"
	@echo "... src/unqlite.i"
	@echo "... src/unqlite.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

