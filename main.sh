#!/bin/bash

set -e

if [[ -z "$AWS_REGION" ]] || [[ -z "$AWS_ACCESS_KEY_ID" ]] || [[ -z "$AWS_SECRET_ACCESS_KEY" ]]; then
  echo "Ensure that all environmental variables (AWS_REGION, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY) are set!"
  exit 1
fi

if [[ -z "$INPUT_SSM_PARAMETER" ]]; then
  echo "Set SSM parameter name (parameter_name) value."
  exit 1
fi

region="$AWS_REGION"
parameter_name="$INPUT_SSM_PARAMETER"
ssm_param=$(aws ssm get-parameter --region "$region" --name "$parameter_name")

format_var_name () {
  echo "$1" | tr "[:lower:]" "[:upper:]"
}

var_name=$(echo "$ssm_param" | jq -r '.Parameter.Name' | awk -F/ '{print $NF}')
var_value=$(echo "$ssm_param" | jq -r '.Parameter.Value')
echo ::set-env name="$(format_var_name "$var_name")"::"$var_value"
