# resource "azurerm_virtual_network" "main" {
#   name                = "aksvnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = var.resource_group_location
#   resource_group_name = azurerm_resource_group.rg.name
# }

# resource "azurerm_subnet" "public" {
#   name                 = "aks-pb01"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.main.name
#   address_prefixes     = ["10.0.1.0/24"]
#   service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
# }

# resource "azurerm_subnet" "private" {
#   name                 = "aks-pv01"
#   resource_group_name  = azurerm_resource_group.main.name
#   virtual_network_name = azurerm_virtual_network.main.name
#   address_prefixes     = ["10.0.2.0/24"]
# }

# resource "azurerm_network_security_group" "nsg" {
#   name                = "aksnsg"
#   location            = var.resource_group_location
#   resource_group_name = azurerm_resource_group.rg.name
# }

# resource "azurerm_subnet_network_security_group_association" "nsgass" {
#   subnet_id                 = azurerm_subnet.private.id
#   network_security_group_id = azurerm_network_security_group.nsg.id
# }

# resource "azurerm_public_ip" "pip" {
#   name                = "natgwpip"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = var.resource_group_location
#   allocation_method   = "Static"
# }

# resource "azurerm_nat_gateway" "natgw" {
#   location            = var.resource_group_location
#   name                = "aksNatGw"
#   resource_group_name = azurerm_resource_group.rg.name
#   sku_name            = "Standard"

#   public_ip_address_ids = [azurerm_public_ip.pip.id]
# }

# resource "azurerm_subnet_nat_gateway_association" "example" {
#   subnet_id      = azurerm_subnet.private.id
#   nat_gateway_id = azurerm_nat_gateway.main.id
# }

