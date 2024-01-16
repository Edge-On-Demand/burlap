#!/bin/bash
# Runs the entire test suite locally.
#
# To run a specific command:
#
#   tox -c tox-full.ini -- -s burlap/tests/test_common.py::CommonTests::test_iter_sites
#
set -e
if [ ! -d .env ]; then
    ./make_dev_env.sh
fi
. .env/bin/activate
./pep8.sh
rm -Rf ./burlap/*.pyc
time tox -c tox-full.ini
