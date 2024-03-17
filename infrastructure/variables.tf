variable "client_id" {
    description = "Azure service principal app id"
}

variable "client_secret" {
    description = "Azure service principal secret "
  
}

variable "tenant_id" {
    description = "Azure tenant id"
  
}

variable "subscription_id" {
    description = "Azure subscription id"
  
}

variable "aks_service_principal_app_id" {
  default = ""
}

variable "aks_service_principal_client_secret" {
  default = ""
}

variable "agent_count" {
  default = 3
}


variable "admin_username" {
  default = "linuxusr"
}

variable "cluster_name" {
  default = "aks-primoti"
}

variable "env" {
 default = "dev"
}

variable "region" {
 default = "East US"
}
variable "dns_prefix" {
  default = "aksprimoti"
}

variable "resource_group_location" {
  default     = "East US"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  default     = "cars-api"
  description = "Resource group name that is unique in your Azure subscription."
}

variable "ssh_public_key" {
  type = string
  sensitive = true
}