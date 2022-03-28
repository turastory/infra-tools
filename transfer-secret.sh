#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo -e "Usage: $0 <secret-name> <from> <to>"
    exit 1
fi

SECRET=$1
FROM=$2
TO=$3

# Check if secret exists
kubectl get secret $SECRET --namespace=$TO &> /dev/null

if [ $? -eq 0 ]; then
    echo "Secret already exists. Skip transfer.";
    exit 1
fi

# Transfer secret from $FROM to $TO
COMMAND="kubectl get secret $SECRET --namespace=$FROM -o yaml | sed 's/namespace: .*/namespace: ${TO}/' | kubectl apply -f -"
echo $COMMAND
eval $COMMAND
