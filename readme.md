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


Follow [thi](https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure-with-service-principle?tabs=bash) article for creating service principal

az ad sp create-for-rbac --name SPN_TERRAFORM_GLOBAL --role Contributor --scopes /subscriptions/cffaa289-ca3b-4126-81da-eb8bc9ef39e9


** TROUBLESHOOTING 

- Storage Account Name: "strguattfdemoaae"): unexpected status 409 (409 Conflict) with error: StorageAccountOperationInProgress: An operation is currently performing on this storage account that requires exclusive access.


Error: A resource with the ID "/subscriptions/cffaa289-ca3b-4126-81da-eb8bc9ef39e9/resourceGroups/rg-dev-tfdemo-aae/providers/Microsoft.Storage/storageAccounts/strgdevtfdemoaae" already exists - to be managed via Terraform this resource needs to be imported into the State. Please see the resource documentation for "azurerm_storage_account" for more information.