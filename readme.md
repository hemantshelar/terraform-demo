## Create storage account for tfstate

`az login`

 

 terraform init --upgrade
 terraform init -reconfigure

 az login --tenant 9e8754b6-f9cd-4aed-974d-a0ec0f3ed703

 terraform plan -out main.tfplan

 terraform apply main.tfplan

 terraform plan -destroy -out main.destroy.tfplan

terraform apply main.destroy.tfplan

[Github Action](https://www.youtube.com/watch?v=Ah17o_1bryo) to enable CI/CD.