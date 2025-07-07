terraform {
  backend "azurerm" {
    resource_group_name  = "n25290-backend-rg"
    storage_account_name = "n25290tfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
