#!/bin/bash

echo '>>>>>Bundling'
rm -fr .bundle && bundle install

rake deploy:prod