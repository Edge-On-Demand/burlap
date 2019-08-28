#!/bin/bash
yapf --in-place --recursive bin
yapf --in-place --recursive burlap
yapf --in-place ./*.py
