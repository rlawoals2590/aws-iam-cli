#!/bin/bash

VERSION=$1

echo "Enter the text:"
read user_input

TARGET_FILE="iam_cli/__init__.py"
TARGET_FILE2="setup.cfg"
TARGET_FILE3="setup.py"

sed -i '' "s/<VERSION>/$VERSION/" "$TARGET_FILE" 
sed -i '' "s/<VERSION>/$VERSION/" "$TARGET_FILE2" 
sed -i '' "s/<VERSION>/$VERSION/" "$TARGET_FILE3" 

git add .
git commit -m "${user_input}"
git push

git tag -a v${VERSION} -m "Release ${VERSION}"
git push origin v${VERSION}