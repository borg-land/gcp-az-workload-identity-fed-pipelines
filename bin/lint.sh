#!/bin/bash

LAYERS=$(cat .layers.json | jq .layers[] -r)

OVERALL_RETURN=0
for LAYER in $LAYERS; do
  echo "terraform fmt $LAYER"

  LINT_OUTPUT=$(cd "$LAYER" && terraform fmt -check=true -write=false -diff=false -list=true)
  LINT_RETURN=$?

  if [ $LINT_RETURN -ne 0 ]
  then
    echo "Linting failed in $LAYER, please run terraform fmt"
    echo $LINT_OUTPUT
    OVERALL_RETURN=1
  fi
done

if [ $OVERALL_RETURN -ne 0 ]
then
  exit $OVERALL_RETURN
fi