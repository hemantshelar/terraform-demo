
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
  uami_principal_id = module.UserAssignedMI.UserAssignedMI
  depends_on = [ 
    module.ResourceGroup.ResourceGroup, 
    module.UserAssignedMI 
  ]
}

module "StorageAccount" {
  source = "../../modules/StorageAccount"
  storage_name = "strgdevtfdemoaae"
  depends_on = [ module.ResourceGroup.ResourceGroup ]
}


module "UserAssignedMI" {
  source = "../../modules/UserAssignedMI"
  depends_on = [ module.ResourceGroup.ResourceGroup ]
}

module "KeyVault" {
  source = "../../modules/KeyVault"
  depends_on = [ module.ResourceGroup.ResourceGroup, module.UserAssignedMI ]
}

module "EntraId" {
  source = "../../modules/EntraId"
}