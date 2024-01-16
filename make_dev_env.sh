#!/bin/bash
# 2016.9.25 Creates a virtual environment for testing and local development
# of the burlap core code.
PYTHON_VERSION=3.12
set -e
sudo apt-get install -y `cat "apt-requirements-test.txt"| sed '/^#/ d' | tr "\\n" " "`
sudo usermod -a -G libvirtd $USER
[ -d .env ] && rm -Rf .env
python$PYTHON_VERSION -m venv .env
.env/bin/pip install burlap
.env/bin/pip install -U pip
.env/bin/pip install -r requirements-test.txt
rm -Rf $PWD/.env/lib/python$PYTHON_VERSION/site-packages/burlap
ln -s $PWD/burlap $PWD/.env/lib/python$PYTHON_VERSION/site-packages
