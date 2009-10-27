#!/bin/sh
#
# SDEFCompiler.sh
#
# Copyright 2009 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License.  You may obtain a copy
# of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations under
# the License.
#
# Takes a file (usually with a suffix of .sdefsrc) and "compiles it" using
# xmllint to verify its correctness. Gets rid of a lot of the guesswork when
# trying to figure out what is wrong with your SDEF file.
# The best way to use SDEFCompiler is to add a custom build rule to your target
# in Xcode with the following settings:
# Process: "Source files with names matching:" "*.sdefsrc"
# using: "Custom script:"
# "Path/to/SDEFCompiler/relative/to/${SRCROOT}'
# with output files:
# ${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/${INPUT_FILE_BASE}.sdef

set -o errexit
set -o nounset
set -o verbose

xmllint --xinclude --valid --postvalid --format ${INPUT_FILE_PATH} > ${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/${INPUT_FILE_BASE}.sdef
