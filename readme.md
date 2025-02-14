 terraform init --upgrade

 az login --tenant 9e8754b6-f9cd-4aed-974d-a0ec0f3ed703

 terraform plan -out main.tfplan

 terraform apply main.tfplan

 terraform plan -destroy -out main.destroy.tfplan

terraform apply main.destroy.tfplan
