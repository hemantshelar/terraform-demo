 terraform init --upgrade

 az login --tenant 9e8754b6-f9cd-4aed-974d-a0ec0f3ed703

 terraform plan -out main.tfplan

 terraform apply main.tfplan

 terraform plan -destroy -out main.destroy.tfplan

terraform apply main.destroy.tfplan


[Module](https://www.youtube.com/watch?v=0YLPfSLbp9Y&list=PLnWpsLZNgHzVVslxs8Bwq19Ng0ff4XlFv&index=4) is a collection of files inside folder.
 - tf files
 - tf JSON files.
What is root module.
 - files contaiing core module

 Variables are used to get informaiton into module.
 Data source to query list of data
 Local variable.

