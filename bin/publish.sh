#!/bin/bash

set -euo pipefail

top=$(cd $(dirname $0) && pwd)/..
mkdir -p "${top}/publish"
for d in "${top}/EN/vol"?
do
	cd "$d"
	name="EN_$(basename "$d").epub"
	epubfile="../../publish/${name}"
	zip -X0 "${epubfile}" mimetype
	zip -X9Dr "${epubfile}" META-INF OEBPS
	cd -
done
