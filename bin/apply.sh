#!/bin/bash

LAYERS=$(cat .layers.json | jq .layers[] -r)

for LAYER in $LAYERS; do
  echo "terraform init $LAYER"
  (cd "$LAYER" && terraform init -input=false -no-color)

  echo "terraform apply $LAYER"
  (cd "$LAYER" && terraform apply --auto-approve -input=false -no-color)

  # for debugging, show these files exist
#   ls -la "/tmp/terraform.$LAYER.plan"
done