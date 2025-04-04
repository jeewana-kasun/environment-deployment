#!/bin/bash

sudo apt-get install jq -y

# Seeting up parameters
ochestration=$(jq -r '.automationConfig.ochestration' config.json)
backendType=$(jq -r '.automationConfig.backendType' config.json)

sh sample.sh $backendType