#!/bin/bash
ZIPFILE=FS25_AdjustableCamera.zip
MODDIR=FS25_AdjustableCamera
if test -f "$ZIPFILE"; then
    echo "Deleting previous $ZIPFILE."
    rm $ZIPFILE
fi

echo "Creating new $ZIPFILE."
(
    cd "$MODDIR" || exit
    zip ../$ZIPFILE ./* > /dev/null
)

if unzip -t "$ZIPFILE" > /dev/null; then
    echo "Zip file integrity check successful."
else
    echo "Zip file integrity check failed."
fi

if [ -n "$1" ]; then
    echo "copy $ZIPFILE to $1"
    cp $ZIPFILE "$1"
    echo "Done."
fi
