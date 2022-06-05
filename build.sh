#!/bin/bash

##################################
# Authors: Mert Ozturk <oztrkmmrtt@gmail.com>
# Date:04.06.2022
# ./build.sh or bash build.sh
#
##################################

BUILD_COMMAND="pip"
USAGE_MESSAGE="
Usage: $(basename $0) [OPTIONS]

	Options:
	-b    <true|false>    Branch Name
	-n    <true|false>    Create New Branch   
	-f    <true|false>    Compress Format
	-p    <true|false>    Copy artifact to spesific path
	-d    <true|false>    Enable debug mode
"

usage(){
	echo "${USAGE_MESSAGE}"
	exit 1
}

while getopts ":b:n:f:p:d" flag
do 
	case "${flag}" in
		b) branch=${OPTARG}
	   ;;
		n) new_branch=${OPTARG}
		 ;;
		f) compress=${OPTARG}
		 ;;
		p) path=${OPTARG}
		 ;;
		d) debug={OPTARG}
		 ;;
		*)
		   usage
		   ;;
	esac
done

if [ "${debug}" == "true" ]; then
	BUILD_COMMAND+=" -X"
fi

eval "$BUILD_COMMAND"

