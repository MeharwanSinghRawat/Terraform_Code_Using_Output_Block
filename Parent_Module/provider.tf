terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

}
provider "azurerm" {
  features {}
  subscription_id = "4dbb4b1d-3932-4f5b-8099-2ee0794bb44a"


}



