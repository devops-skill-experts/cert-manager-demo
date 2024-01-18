#!/bin/bash

if [[ ${KUBECONFIG} == "" ]]
then
    echo "Please export KUBECONFIG env variable before running script!!!"
    exit 1
else
    echo "Current value of KUBECONFIG --> [${KUBECONFIG}]"
fi

export $(xargs <.env)

cd "04-1-install-echo-certificate"
helm dependency update
helm upgrade -i init-echo-certificate . -f values.yaml -n echo --create-namespace
cd ..
