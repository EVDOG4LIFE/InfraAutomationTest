variable "vsphere_user" {
    description = "The username for vSphere API operations."
    type        = string
}

variable "vsphere_password" {
    description = "The password for vSphere API operations."
    type        = string
}

variable "vsphere_server" {
    description = "The vCenter server name for vSphere API operations."
    type        = string
}

variable "vm_count" {
    description = "The number of VMs to create."
    type        = number
    default     = 4
}
