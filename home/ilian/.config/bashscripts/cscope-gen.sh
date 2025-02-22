#!/usr/bin/env bash
cscope_gen(){
	find . -name '*.py' \
		-o -name '*.java' \
		-o -iname '*.[CH]' \
		-o -name '*.cpp' \
		-o -name '*.hpp' \
		-o -name '*.cc' \
		> cscope.files

	# -b: just build
	# -q: create inverted index

	cscope -b -q
}
