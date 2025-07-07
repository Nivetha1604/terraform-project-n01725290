terraform {
  backend "azurerm" {
    resource_group_name  = "n25290-backend-rg"
    storage_account_name = "n25290tfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    access_key = "KLJ+1LrIgI/bzln+DXfrMtxPNEGfPcbXk8qqtX+l65+K1LwS6KX3zfWnYUd90lOc/W3lvaF+lIJ2+AStb0AOZQ=="
  }
}
