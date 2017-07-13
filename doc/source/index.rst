Welcome to GHDL Sample Project
==============================

This project provides an easy but power full building system for VHDL code to
run simulations using GHDL project.

Install Dependencies
--------------------

In order to use this sample project and building system you need first to
install GHDL. To install GHDL follow `this
<http://ghdl.free.fr/site/pmwiki.php?n=Main.Installation/>`_.

Indexing VHDL Files
-------------------

In order to GHDL to work it has to index all `entities` from all VHDL source
files. For doing so simply run;

.. code::

  cd <your-project-code-path>
  mkdir build
  cd build
  cmake ..
  make index

Run Tests
---------

To build the test's binaries you first need to;

.. code::

  cd <your-project-code-path>/build
  make check

The summary of the tests will be displayed and it looks like the following;

.. code::
  Test project /ws/git/ghdl_sample_project/build
    Start 1: test.adder.adder_tb
  1/4 Test #1: test.adder.adder_tb .............................   Passed    0.00 sec
    Start 2: test.viterbi_encoder.viterbi_encoder_tb
  2/4 Test #2: test.viterbi_encoder.viterbi_encoder_tb .........   Passed    0.00 sec
    Start 3: test.viterbi_encoder.next_state_lkup_table_tb
  3/4 Test #3: test.viterbi_encoder.next_state_lkup_table_tb ...   Passed    0.00 sec
    Start 4: test.viterbi_encoder.output_lkup_table_tb
  4/4 Test #4: test.viterbi_encoder.output_lkup_table_tb .......   Passed    0.00 sec

  100% tests passed, 0 tests failed out of 4

  Total Test time (real) =   0.02 sec


For every test there's one VCD trace file automatically created. You can find
the VCD files at `<your-project-code-path>/build/trace/`. The traces are
placed according to the folder structure of the `<your-project-code-path>/test/`
directory.


Building System Description
---------------------------

Our code is completely `IDE` independent. For supporting the compiling and
simulation of the code we had to develop our own building system using
`CMake <https://cmake.org/>`_.

The building system is based on two simple yet powerful `CMake` macros.

.. code::

  # Add source directory
  add_sources_directory(dir1 dir2 ...)

  # Add source file
  add_sources(file1 file2 ...)

The basic idea behind our building system is to specify directories having
source codes and inside every directory with sources specify which files are
source files. For example, `<your-project-code-path>/src/CMakeLists.txt`,
specifies `common`, `decoder` and `encoder` as sources directories as follows;

.. code::

  # Add source directory
  add_sources_directory(adder/
                        viterbi_encoder/)

Furthermore, `<your-project-code-path>/src/viterbi_encoder/CMakeLists.txt`
should look like;

.. code::

  # Add sources
  add_sources(viterbi_encoder.vhdl
              next_state_lkup_table.vhdl
              output_lkup_table.vhdl)


.. note::
  * You can specify source code directories and files in the same
    `CMakeLists.txt` file.
  * You can specify as many source code directories and files using the same
    macro call (`add_sources_directory(...)` and `add_sources(...)`
    respectively).
  * Every source code directory added using `add_sources_directory(...)` has to
    contain a `CMakeLists.txt` file.

Our main `CMakeLists.txt` at `<your-project-code-path>` does the rest.

Test Building System
********************

For tests we have a simliar building system but the CMake macros are named
differently. They are the following;

.. code::

  # Add test source directory
  add_test_sources_directory(dir1 dir2 ...)

  # Add test source file
  add_test_sources(file1 file2 ...)
