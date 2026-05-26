variable "vm_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "nic_id" {}
variable "admin_username" {}
variable "admin_password" {}
variable "vm_size" {}

variable "tags" {
  type = map(string)
}
