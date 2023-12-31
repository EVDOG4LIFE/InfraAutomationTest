variable "bigip_host" {
    description = "The hostname/IP of the F5 BIG-IP load balancer"
    type        = string
}

variable "bigip_user" {
    description = "The username for F5 BIG-IP"
    type        = string
}

variable "bigip_password" {
    description = "The password for F5 BIG-IP"
    type        = string
}

variable "node_addresses" {
    description = "The IP addresses of the nodes to be added to the pool"
    type        = list(string)
}
