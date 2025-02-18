
module "ResourceGroup" {
  source = "./ResourceGroup"
  location = "Australia East"
  rg-prefix = "rg"
  project-name = "tfdemo"
  location-prefix = "aee"
  env-prefix = "dev"
}