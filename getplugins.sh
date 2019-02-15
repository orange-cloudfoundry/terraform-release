TERRAFORM_SHARED_DIR=./.terraform/plugins/linux_amd64
TERRAFORM_VER=0.11.11


PROVIDER_CLOUDFOUNDRY_VERSION=0.11.2
PROVIDER_CLOUDFOUNDRY_SUM=cad949683898195c44864e290fa0d0d9207eb75fdacaf94544e1c77ecb9f5246

PROVIDER_CREDHUB_VERSION=0.12.1
PROVIDER_CREDHUB_SUM=c0754519249e68e014e5fead1f3005eeabe1186f773406b695d96fe649a3a21d

PROVIDER_UAA_VERSION=0.9.0
PROVIDER_UAA_SUM=bfbab04dde59e70354c98f4516924c447d70c3bb3a5689dd4d6466e744162220

mkdir -p ${TERRAFORM_SHARED_DIR}

# Terraform CF provider name is not version dependant
set -ex \
    && export FILENAME="terraform-provider-cloudfoundry" \
    && export FILENAME_SUFFIX="_0.11_linux_amd64" \
    && export FULL_FILENAME="$FILENAME$FILENAME_SUFFIX" \
    && export URL="https://github.com/orange-cloudfoundry/terraform-provider-cloudfoundry/releases/download/v${PROVIDER_CLOUDFOUNDRY_VERSION}/${FULL_FILENAME}" \
    && export SUM=${PROVIDER_CLOUDFOUNDRY_SUM} \
    && wget ${URL} -O /tmp/${FULL_FILENAME} \
    && echo "Computed sha256sum: $(sha256sum /tmp/${FULL_FILENAME})" \
    && echo "${SUM}  /tmp/${FULL_FILENAME}" | sha256sum -c - \
    && mv /tmp/${FULL_FILENAME} ${TERRAFORM_SHARED_DIR}/${FILENAME}_v${PROVIDER_CLOUDFOUNDRY_VERSION} \
    && chmod +x ${TERRAFORM_SHARED_DIR}/*

# Terraform Credhub provider name is not version dependant
set -ex \
    && export FILENAME="terraform-provider-credhub" \
    && export FILENAME_SUFFIX="_linux_amd64" \
    && export FULL_FILENAME="$FILENAME$FILENAME_SUFFIX" \
    && export URL="https://github.com/orange-cloudfoundry/terraform-provider-credhub/releases/download/v${PROVIDER_CREDHUB_VERSION}/${FULL_FILENAME}" \
    && export SUM=${PROVIDER_CREDHUB_SUM} \
    && wget ${URL} -O /tmp/${FULL_FILENAME} \
    && echo "Computed sha256sum: $(sha256sum /tmp/${FULL_FILENAME})" \
    && echo "${SUM}  /tmp/${FULL_FILENAME}" | sha256sum -c - \
    && mv /tmp/${FULL_FILENAME} ${TERRAFORM_SHARED_DIR}/${FILENAME}_v${PROVIDER_CREDHUB_VERSION} \
    && chmod +x ${TERRAFORM_SHARED_DIR}/* \
    && echo "Computed sha256sum: $(sha256sum ${TERRAFORM_SHARED_DIR}/${FILENAME}_v${PROVIDER_CREDHUB_VERSION})"

# Terraform UAA provider name is not version dependant
set -ex \
    && export FILENAME="terraform-provider-uaa" \
    && export FILENAME_SUFFIX="_linux_amd64" \
    && export FULL_FILENAME="$FILENAME$FILENAME_SUFFIX" \
    && export URL="https://github.com/orange-cloudfoundry/terraform-provider-uaa/releases/download/${PROVIDER_UAA_VERSION}/${FULL_FILENAME}" \
    && export SUM=${PROVIDER_UAA_SUM} \
    && wget ${URL} -O /tmp/${FULL_FILENAME} \
    && echo "Computed sha256sum: $(sha256sum /tmp/${FULL_FILENAME})" \
    && echo "${SUM}  /tmp/${FULL_FILENAME}" | sha256sum -c - \
    && mv /tmp/${FULL_FILENAME} ${TERRAFORM_SHARED_DIR}/${FILENAME}_v${PROVIDER_UAA_VERSION} \
    && chmod +x ${TERRAFORM_SHARED_DIR}/*

#ENV TF_DATA_DIR "/.terraform"
#COPY plugin_cache.tf /tmp/
#RUN cd /tmp && terraform init

#ENV TF_INPUT 0
