#!/bin/bash

clear

echo "Please wait a moment while the required gems are installed."
bundle install
gem update --system
echo "The Future of Medication Tracking is apon you!!!"
echo "Warning Work in progress"
ruby main.rb