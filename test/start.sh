#!/bin/bash

sudo apt-get install jq -y

# Seeting up parameters
ochestration=$(jq -r '.automationConfig.ochestration' config.json)
backendType=$(jq -r '.automationConfig.backendType' config.json)

sh sample.sh $backendType

elif [ "$ochestration" = "k8s" ]; then

    echo "|||||||||||||||||||||||||||||"
    echo "Kubernetes execution is not yet implemented"
    echo "|||||||||||||||||||||||||||||"
    
else
    echo "It's not a valid option... Bye Bye !!!"
fi