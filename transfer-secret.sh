#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
    echo -e "Usage: $0 <from> <to>"
    exit 1
fi

FROM=$1
TO=$2

COMMAND="kubectl get secret $FROM --namespace=bser -o yaml | sed 's/namespace: .*/namespace: ${TO}/' | kubectl apply -f -"
echo $COMMAND
