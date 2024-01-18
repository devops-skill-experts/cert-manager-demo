#!/bin/bash

if [[ ${KUBECONFIG} == "" ]]
then
    echo "Please export KUBECONFIG env variable before running script!!!"
    exit 1
else
    echo "Current value of KUBECONFIG --> [${KUBECONFIG}]"
fi

export $(xargs <.env)

cd "03-1-cert-manager"
helm dependency update
helm upgrade -i init-cert-manager . -f values.yaml -n cert-manager --create-namespace
cd ..
