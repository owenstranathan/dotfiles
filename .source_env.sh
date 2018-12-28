#!/bin/bash
# source me!
EXPORTS=($(cat "$PWD/.env"))
for exp in "${EXPORTS[@]}"; do
  exp="export $exp"
  eval "$exp"
done
