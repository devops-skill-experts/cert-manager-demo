#!/bin/bash

if [[ ${KUBECONFIG} == "" ]]
then
    echo "Please export KUBECONFIG env variable before running script!!!"
    exit 1
else
    echo "Current value of KUBECONFIG --> [${KUBECONFIG}]"
fi

export $(xargs <.env)

cd "03-2-cluster-issuer"
helm dependency update
helm upgrade -i init-cluster-issuer . -f values.yaml -n cert-manager --create-namespace
cd ..
