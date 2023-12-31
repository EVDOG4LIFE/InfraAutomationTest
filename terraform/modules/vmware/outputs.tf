output "virtual_machine_ips" {
    value = vsphere_virtual_machine.vm.*.guest_ip_addresses
    description = "The IP addresses of the virtual machines"
}

output "virtual_machine_names" {
    value = vsphere_virtual_machine.vm.*.name
    description = "The names of the virtual machines"
}

output "virtual_machine_ids" {
    value = vsphere_virtual_machine.vm.*.id
    description = "The IDs of the virtual machines"
}