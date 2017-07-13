# Welcome to GHDL Sample Project

This project provides an easy but power full building system for VHDL code to
run simulations using GHDL project.

## Full documentation

You can find the full documentation [here](http://ghdl-sample-project.readthedocs.io/en/latest/).

## Install Dependencies

In order to use this sample project and building system you need first to
install GHDL. To install GHDL follow [this](http://ghdl.free.fr/site/pmwiki.php?n=Main.Installation/).

## Indexing VHDL Files

In order to GHDL to work it has to index all `entities` from all VHDL source
files. For doing so simply run;

```

cd <your-project-code-path>
mkdir build
cd build
cmake ..
make index

```

## Run Tests


To build the test's binaries you first need to;

```

cd <your-project-code-path>/build
make check

```

The summary of the tests will be displayed and it looks like the following;

```

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

```

For every test there's one VCD trace file automatically created. You can find
the VCD files at `<your-project-code-path>/build/trace/`. The traces are
placed according to the folder structure of the `<your-project-code-path>/test/`
directory.
