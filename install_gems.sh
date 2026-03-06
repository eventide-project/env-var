#!/usr/bin/env bash

echo
echo "Installing gems to ./gems"
echo '= = ='
echo

echo "Removing gems directory..."
rm -rf ./gems
echo "Removing .bundle directory..."
rm -rf .bundle
echo "Removing Gemfile.lock file..."
rm -f Gemfile.lock

echo
echo "Setting installation path"
echo "- - -"

cmd="bundle config set --local path ./gems"

echo $cmd
($cmd)


echo
echo "Installing"
echo "- - -"

cmd="bundle install --standalone"

echo $cmd
($cmd)

echo "= = ="
echo "Done"
echo
