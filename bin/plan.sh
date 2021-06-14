#!/bin/bash

LAYERS=$(cat .layers.json | jq .layers[] -r)

for LAYER in $LAYERS; do
  echo "terraform init $LAYER"
  (cd "$LAYER" && terraform init -input=false -no-color)

  echo "terraform plan $LAYER"
  (cd "$LAYER" && terraform plan -input=false -no-color -out="/tmp/terraform.$LAYER.plan")

  # for debugging, show these files exist
#   ls -la "/tmp/terraform.$LAYER.plan"
done