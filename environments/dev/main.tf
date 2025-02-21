
module "ResourceGroup" {
  source = "../../modules/ResourceGroup"
  location = "Australia East"
  rg-prefix = "rg"
  project-name = "tfdemo"
  location-prefix = "aee"
  env-prefix = "dev"
}

module "AppService" {
  source = "../../modules/AppService"
  app_service_plan_name = "test"
}

module "StorageAccount" {
  source = "../../modules/StorageAccount"
  storage_name = "strgdevtfdemoaae" 
}


module "UserAssignedMI" {
  source = "../../modules/UserAssignedMI"
}

