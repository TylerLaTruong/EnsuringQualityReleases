resource "azurerm_network_interface" "test" {
  name                = "NIC-${var.resource_type}-${var.application_type}"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.public_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                  = "${var.resource_type}-${var.application_type}"
  location              = var.location
  resource_group_name   = var.resource_group
  size                  = "B1s"
  admin_username        = var.admin_username
  network_interface_ids = [azurerm_network_interface.test.id]
  admin_ssh_key {
    username   = var.admin_username
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzUoDgAB5iGrBIpK8X+HufpzV/RVItXqe2S5nfLrA4W4kXG4coE26pUxNLcm/dWen+w51AnCXSl924rzLSjD7CpX3MgSyYO6GukouXJXLVzFlT50pAfSy8qumQwWq5Log9cffWHmo/Dm3OaxdsGWpUsYP/X5vDRDRVMfxVeSRBInDcPMMZRFFCfo7WQUUxRxG8MimtYoNdy8Dcy7tSXG701gN18ZsbzWuD8JIX6xEMbgwJQxpoSUTEvuDk7voGhoK1c41OJh+Qfi0J7LPQB9AiBHVZhC226TxKDnXrLlnmJIsXwDDccxw94fcDWulW2jf7CBNb355ROQzYW1hEtAwLJWJd7+rCcKwnKaNDGoik++9Kd9yTFvihQ83rfW26sv6kphqgiLv26XnRq2WdUXqy/zs0I2E8AuIUj2ra2o5uc0Fo/Xw6FlywQAXmNfH6ouwGOnJn3gMSDdVTy569MsZVKcCLkJTGeg4P8wLx016RLO7ZlGaVOQXpQE0bpZPyVjk= generated-by-azure"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    id = "/subscriptions/82c40d1f-be09-4c9e-9295-ae70e625b7b5/resourceGroups/Azuredevops/providers/Microsoft.Compute/galleries/UdacityAzureDevOps3Gallery/images/UdacityAzureDevOps3Image/versions/0.0.1"
  }
}
