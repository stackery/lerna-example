#!/bin/bash

set -e
rm -rf .aws-sam/build
mkdir -p .aws-sam/build
mkdir -p .aws-sam/build/src
for dir in src/*; do
(
  (
    echo $dir
    cd $dir
    npm install
  )
  cp -LR "$dir" ".aws-sam/build/src/" 
  echo "build $dir complete"
) &
done
wait
cp .stackery/template.yaml .aws-sam/build/



