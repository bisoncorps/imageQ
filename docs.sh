#!/bin/bash

cd ./docs
sphinx-apidoc -f -o source/ ../ImageQ
make html
cd ..
git commit -am "make html"
git config --global push.default simple
git config --global user.email "travis@travis-ci.com"
git config --global user.name "Travis CI"
git checkout -b gh-pages
#remove existing files except html
shopt -s extglob
rm -r ./!(docs)/
#copy contents of html to root
cp -R ${TRAVIS_BUILD_DIR}/docs/build/html/. ${TRAVIS_BUILD_DIR}/
#remove html and accompanying docs  
rm -r ./docs
git add .
git commit -am "rebuilt docs"
git push -q https://${GITHUB_TOKEN}@github.com/bisoncorps/imageQ.git gh-pages --force
# echo if docs was succesfully pushed
if [ $? -eq 0 ]; then
    echo "Docs successfully pushed to Github Pages"
else
    echo "Failed to push docs"
fi
