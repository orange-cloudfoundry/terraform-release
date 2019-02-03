#!/bin/sh
TERRAFORM_VERSION="0.11.11"
wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -nv -O ./terraform-${TERRAFORM_VERSION}.zip 
bosh add-blob ./terraform-${TERRAFORM_VERSION}.zip terraform-${TERRAFORM_VERSION}.zip
# unzip -q /tmp/terraform.zip -d /usr/local/bin

