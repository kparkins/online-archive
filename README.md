# Online Archive with Terraform

This is a small repository designed to use terraform and ansible to setup and provision a cluster in a single region with Online Archive.

## Setup 

First, make sure you have `ansible`, `terraform`, `mongosh` and `mongoimport` installed on your local machine.

Next, copy the tfvars file and fill it in with your details.
```bash
cd terraform
cp atlas.tfvars.json.sample atlas.tfvars.json
```

Next, initialize and run the terraform script.
```bash
terraform init
terraform plan -var-file=atlas.tfvars.json
terraform apply -var-file=atlas.tfvars.json
```

It will take around 10-12 minutes to setup the cluster. 

## Cleanup

Run the corresponding `terraform destroy` command to cleanup all the resources.
```bash
terraform destroy -var-file=atlas.tfvars.json
```

## Counting Documents

From the root directory we can run an ansible script to count the number of documents in the database and in the archive. 
```bash
ansible-playbook -v -i ./ansible/inventory.yml ./ansible/count-docs.yml --extra-vars '@terraform/atlas.tfvars.json'
```

