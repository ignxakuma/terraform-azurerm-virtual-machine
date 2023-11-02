terraform {
 backend "azurerm" {
    resource_group_name   = "Demo-rg"
    storage_account_name  = "demo171998"
    container_name        = "state"
    key                   = "terraform.tfstate"
  }
}
