#!/bin/bash
set -e
xelatex -interaction=nonstopmode resume.tex 2>&1 | tail -5
