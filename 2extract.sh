#!/bin/bash

cat split.txt | tail -n +1 | head -n 100 > extract.txt
