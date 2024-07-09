#!/usr/bin/env sh
curl -s https://registry.npmjs.org/wiki/-/wiki-0.36.1.tgz | tar xfz -
cd package
npm i --lockfile-version 2 --package-lock-only
cd ..
cp package/package-lock.json .
flatpak-node-generator npm package-lock.json -o generated-sources.json
