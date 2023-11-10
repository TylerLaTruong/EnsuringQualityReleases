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
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCw/NcM4Ec0waiaxTt01dcneRTRB4oOcIdmmFYTOwrcLzw07BlYTagJHeb9ykuOmmaHBK4VaiEUYyOAz9zXD/V93N5wZneo88LP6Ck+JWzRdJEoC1c67QUK3zKnpRo/LUuqLom0QUTHT2HI8oLiXtkFolIHsMEoF4fdGAvO8XJOsat/vQ6RD0coBsYsqtoGAFLw8AglqQB43Ld06rPPlOZyeNNJbiiM40R7sml4l9kgBd4pWofOcyCzDu/D7banlDXcBZPVQtPkfflFT+Fi1zrVa3iYhtlUn6K5UN/LdiTGm8EsLm69SlqYzhuQUf7C28AHQhzaanIFKcbEKGPoldcgddZr979W5FxcTTAFExI0JAdnOy9dUcyrzowmwkVzqI5zeA9wA1CgoYz4H5cZ6NJGFfoJ7fSEFQWd4HvMuD1McKQeHmXQXQkdopZW145FLDqeI492VLEFJy/a6MWS17nWwulgFotMgEGDRtBCl8nmMnvRsDXVCC0mcJbmNKYzkLC7+NwSvWZkIO2hm3yqre+HDnMzBHJendHaTOiX2q4+7DTfeYJG4hQG4pAIDRjlkqnbPAqA4ibyCDUJmNUgmPZsrRbe4WKpD9TrLd1MbSrWdbI6HvKGu14b5XDkWjjWE9eZyy4mEZG5yO6ygO8847Yd+KG4JS9BMIywcCdhO+XO6w== fsoft.fpt.vn\truonglv9@Temp-TruongLV9"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    id = "/subscriptions/e7a256dc-769a-421c-9f8e-e283ed3cbefa/resourceGroups/Azuredevops/providers/Microsoft.Compute/galleries/UdacityAzureDevOps3Gallery/images/UdacityAzureDevOps3Image/versions/0.0.1"
  }
}
