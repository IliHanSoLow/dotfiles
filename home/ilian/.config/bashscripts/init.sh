#!/usr/bin/env bash
pushd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null
files=$(find . -name "*.sh" ! -name "init.sh")

for f in $files
do 
	source $f
done

popd > /dev/null
