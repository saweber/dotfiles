#!/bin/bash
#change file ownership
chown -R $(whoami) /home/ubuntu/
#echo Installing eslint and jest...
npm install -g jest eslint eslint-config-airbnb-base eslint-plugin-import;
