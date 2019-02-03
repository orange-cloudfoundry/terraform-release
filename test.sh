#/bin/sh
bosh create-release --force
bosh upload-release
bosh -d terraform-deployment  deploy ./templates/terraform-deployment.yml 
bosh run-errand terraform-apply --keep-alive
