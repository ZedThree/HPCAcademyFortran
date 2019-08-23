HPC Academy: Fortran
====================

These are lecture notes for the Fortran track taught by Peter Hill for
the HPC Academy 2019 in Cambridge, UK.

Slides
------

The slides need `pandoc-include-code` to build:

https://github.com/owickstrom/pandoc-include-code

And then just `make` will build the slides.

Examples
--------

The examples can be built as follows:

    cd examples
    mkdir build && cd build
    cmake ..
    make
