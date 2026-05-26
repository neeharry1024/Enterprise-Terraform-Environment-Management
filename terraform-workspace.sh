#!/bin/bash

ENV=$1

terraform workspace new $ENV || terraform workspace select $ENV

echo "Current Workspace:"
terraform workspace show
