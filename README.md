# gha-aws-ssm-parameters
Fetch SSM parameters to Environment variable.

Replaces "-" with "_" and makes environment variable as upper case.

### Parameters

Parameter name | Type | Required | Default Value | Description
--- | --- | --- | --- | ---
`ssm_parameter` | string | true | | AWS Systems Manager parameter name (path)

### Examples

```yaml
name: Parse SSM parameters

on:
  push

jobs:
  gha-aws-ssm-parameters:
    runs-on: ubuntu-latest
    steps:
      - name: gha-aws-ssm-parameters
        uses: ollisala/gha-aws-ssm-parameters@master
        env:
          AWS_REGION: ${{ secrets.AWS_REGION }}
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        with:
          parameter_name: 'TesTing-parameters'
```

Example above will set environmental variable `AWS_SSM_TESTING_PARAMETERS`.
