# Online Archive with Terraform

This is a small repository designed to use terraform and ansible to setup and provision a cluster in a single region with Online Archive. It uses the format outlined in (the Atlas sizing lab)[https://docs.google.com/document/d/1X0cLZtQZ19OAqCwxSeF5b5vc4mtR2MUeqvArwhS_XEE/edit]. 

## Directions

First, copy the tfvars file and fill it in with your details.
```bash
cp atlas.tfvars.sample atlas.tfvars
```
Next, initialize and run the terraform scrip.
```bash
terraform init
terraform plan -var-file=atlas.tfvars
terraform apply -var-file=atlas.tfvars
```

