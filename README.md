# Infra chores toolbox

Toolbox for infra tasks (mostly Docker and Kubernetes)

## What is this?

It's a collection of scripts or configurations that appears many times in your scripts (like deployment scripts)

## How to use it?

Anyware in your script:

```bash
git clone git@github.com:turastory/infra-tools.git

# Transfer k8s secret from namespace A to namespace B, for example.
./infra-tools/transfer-secret.sh secret-name A B
```
