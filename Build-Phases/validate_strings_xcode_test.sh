#!/bin/sh

#  validate_strings_xcode.sh
#
#  This script can be used in conjunction with the Rubustrings project
#  https://github.com/dcordero/Rubustrings and Xcode custom build rules to
#  automatically validate .strings files in a project at compile-time. In
#  addition to basic validation, it will attempt to alert Xcode to the exact
#  file and line that is having an option, allowing the developer to
#  double-click on the Xcode error to see where the problem is.
#
#  To use, create a new custom build rule with the following configuration:
#  1. Source files with names matching: *.strings
#  2. Custom script: "${SRCROOT}/path/to/this/script/validate_strings_xcode.sh"
#  3. Output files: $(DERIVED_FILE_DIR)/$(INPUT_FILE_BASE).strings
#
#  By default this assumes that rubustrings is installed in the same directory
#  as this script, change RUBUSTRINGS variable to customize. If you have
#  multiple targets, this setup might need to be repeated for each one
#

#find . -name "*.strings"

#for f in $(ls *.strings)
#do
#	echo "found file"
#  grep -qi hq.*mp3 $f \
#    && echo -e 'Playlist $f contains a HQ file in mp3 format' 
#done

RUBUSTRINGS=$(dirname "${0}")"/rubustrings"
OUTPUT_FILE="${SCRIPT_OUTPUT_FILE_0}"

find . -name 'Localizable.strings' -print0 | 
    while IFS= read -r -d $'\0' line; do 


        echo $line
        "${RUBUSTRINGS}" -xcode "$line"
    done


#INPUT_FILE="${INPUT_FILE_PATH}"


#"${RUBUSTRINGS}" -xcode "${INPUT_FILE}"
#if [[ 0 -eq $? ]]; then
#	cp "${INPUT_FILE}" "${OUTPUT_FILE}"
#else
#	echo "Could not validate ${INPUT_FILE}"
#	exit 1
#fi
#exit 0
