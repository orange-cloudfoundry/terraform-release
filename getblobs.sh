#!/bin/sh
TERRAFORM_VERSION="0.11.7"
wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -nv -O ./terraform-${TERRAFORM_VERSION}.zip 

# unzip -q /tmp/terraform.zip -d /usr/local/bin

