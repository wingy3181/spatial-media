#!/bin/bash

# Pre-requisites:
# - pyinstaller
#   - List installed pip packages
#     - pip3 list
#   - Install
#     - pip3 install -U pyinstaller
#     - python3.11 -m pip install --upgrade pip
#   - Uninstall
#     - pip3 uninstall pyinstaller pyinstaller-hooks-contrib
#     - Use following commands to work out what other pythonn transitive dependency packages to uninstall
#       - pip3 list
#       - pipe3 show pyinstaller
#   Ref: https://github.com/google/spatial-media/issues/261#issuecomment-1590148367
#     Steps 5-7
pyinstaller ./spatialmedia/gui.py --windowed
