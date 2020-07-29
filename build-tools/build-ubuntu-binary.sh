#!/bin/bash
### Ubuntu use pyinstall v3.0
THIS_SCRIPT_PATH=`readlink -f $0`
THIS_SCRIPT_DIR=`dirname ${THIS_SCRIPT_PATH}`

if [ ! -e "pyinstaller" ]; then
    git clone https://github.com/pyinstaller/pyinstaller
    cd pyinstaller
    git checkout v3.6
fi
cd ${THIS_SCRIPT_DIR}

rm -r build
rm -r dist
rm labelImg.spec
python3 pyinstaller/pyinstaller.py --hidden-import=xml \
            --hidden-import=xml.etree \
            --hidden-import=xml.etree.ElementTree \
            --hidden-import=lxml.etree \
            --hidden-import=PyQt5.sip \
             -D -F -n labelImg -c "../labelImg.py" -p ../libs -p ../

FOLDER=$(git describe --abbrev=0 --tags)
FOLDER="linux_"$FOLDER
rm -rf "$FOLDER"
mkdir "$FOLDER"
cp dist/labelImg $FOLDER
cp -rf ../data $FOLDER/data
cp -f ../resources/icons/app.png $FOLDER
cp -f ../resources/labelImg.desktop $FOLDER
#zip "$FOLDER.zip" -r $FOLDER

rm -r build
rm -r dist
rm labelImg.spec
