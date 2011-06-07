#!/usr/bin/env bash

RAILS_ASSET_ID= RAILS_ENV=production ./script/server -p 3333 &
pid=$!

sleep 5

rm -rf tmp/web
mkdir tmp/web && cd tmp/web
wget "http://localhost:3333" -r -nH || exit 1
gsed -i 's#http://localhost:3333/##g' *.html 
gsed -i 's#/\(stylesheets\)#\1#g' *.html 
gsed -i 's#/\(images\)#\1#g' *.html 
cd ../..
tree tmp/web
sleep 2

echo "KILLING RAILS PID $pid .."
kill $pid

