#!/usr/bin/bash
set -ex

VERSION="$(sed -E 's/[.]/_/gm;t;d' <<< "REL$1")"
DWLURL=$(curl "https://www.mediawiki.org/w/api.php?action=query&format=json&list=extdistbranches&edbexts=$2" | jq ".query.extdistbranches.extensions | .[ \"$2\" ].\"$VERSION\"")
FILENAME=$(echo $DWLURL | sed -E 's/https:\\/\\/extdist.wmflabs.org\\/dist\\/extensions\\///gm;t;d')

echo "info: downloading $DWLURL"
wget "$DWLURL" -O "/tmp/$FILENAME"