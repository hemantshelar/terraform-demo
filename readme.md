## Create storage account for tfstate

`az login`

 

 terraform init --upgrade
 terraform init -reconfigure

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





# Create a storage account 

resource "azurerm_storage_account" "stg" {
    name = "stgtestaccount555"
    resource_group_name = azurerm_resource_group.rg.name
    location = "${azurerm_resource_group.rg.location}"
    account_tier = "Standard"
    account_replication_type = "LRS"
  
}

#Create service bus

resource "azurerm_servicebus_namespace" "sbns" {
  name                = "${var.environment}-tfdemo-servicebus-namespace"
  location            = "${var.resource_group_location}"
  resource_group_name = azurerm_resource_group.rg.name 
  sku                 = "Standard"

  tags = {
    source = "terraform"
  }
}

#Create a queue
resource "azurerm_servicebus_queue" "sbq" {
  name         = "${var.environment}-tfdemo-servicebus-queue"
  namespace_id = azurerm_servicebus_namespace.sbns.id
  partitioning_enabled = true
  dead_lettering_on_message_expiration = true
  max_delivery_count = 7
}

#Create a topic
resource "azurerm_servicebus_topic" "sbt" {
  name         = "${var.environment}-tfdemo-servicebus-topic"
  namespace_id = azurerm_servicebus_namespace.sbns.id
}

#Create a subscription
resource "azurerm_servicebus_subscription" "ass" {
  name               = "all_customers_subscription"
  topic_id           = azurerm_servicebus_topic.sbt.id
  max_delivery_count = 7
}

resource "azurerm_servicebus_subscription_rule" "assr" {
  name            = "vip_customers_rule"
  subscription_id = azurerm_servicebus_subscription.ass.id
  filter_type     = "SqlFilter"
  sql_filter      = "ID = 1"
}