#!/bin/bash

set -x

bundle exec jekyll serve --incremental --trace --livereload &
SERVER=$!
sleep 20
npx blc --exclude http://localhost:4000/doc --exclude http://localhost:4000/docs -re http://localhost:4000
RES=$?
kill $SERVER
if [ "${RES}" != 0 ];
then
    echo "Found broken links!"
    exit 1
fi