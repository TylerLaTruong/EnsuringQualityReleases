provider "azurerm" {
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}
terraform {
  backend "azurerm" {
    storage_account_name = "tfstate270895"
    container_name       = "tfstate"
    key                  = "test.terraform.tfstate"
    access_key           = "Q+X00IE/RQqQzQF1M1iqQ1vfMNoICefLK4NvWGU+jPAvD/DohIJ+7KiqQ9YssA0sQk5UjCeR4NtS+ASt8y+uZQ=="
  }
}

module "resource_group" {
  source         = "../../modules/resource_group"
  resource_group = var.resource_group
  location       = var.location
}

module "network" {
  source               = "../../modules/network"
  address_space        = "${var.address_space}"
  location             = "${var.location}"
  application_type     = "${var.application_type}"
  resource_type        = "vnet"
  resource_group       = "${var.resource_group}"
  address_prefix_test  = "${var.address_prefix_test}"
}

module "nsg-test" {
  source           = "../../modules/networksecuritygroup"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "nsg"
  resource_group   = "${var.resource_group}"
  subnet_id        = "${module.network.subnet_id_test}"
  address_prefix_test = "${var.address_prefix_test}"
}
module "appservice" {
  source           = "../../modules/appservice"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "app-service"
  resource_group   = "${var.resource_group}"
}
module "publicip" {
  source           = "../../modules/publicip"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "ip"
  resource_group   = "${var.resource_group}"
}

module "vm" {
  source           = "../../modules/vm"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "linux-vm"
  resource_group   = "${var.resource_group}"
  subnet_id        = "${module.network.subnet_id_test}"
  public_ip_address_id = "${module.publicip.public_ip_address_id}"
  vm_username = "${var.vm_username}"
  vm_password = "${var.vm_password}"
  # image_name = "${var.image_name}" 
  # image_resource_group_name = "${var.resource_group}"
}
