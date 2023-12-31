provider "vsphere" {
    user           = var.vsphere_user
    password       = var.vsphere_password
    vsphere_server = var.vsphere_server

    # if you have a self-signed cert
    allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
    name = "dc1"
}

data "vsphere_compute_cluster" "cluster" {
    name          = "cluster1"
    datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
    count = var.vm_count
    name  = "terraform-test-${count.index}"
    // VM Memory 16gb, CPU 4core, C Drive 250gb, E Drive 500gb configuration
    num_cpus = 4
    memory   = 16384
    guest_id = "windows9Server64Guest"
    cluster_id = data.vsphere_compute_cluster.cluster.id

    network_interface {
        label = "VM Network"
        adapter_type = "vmxnet3"
    }

    disk {
        label = "disk0"
        size  = 250
    }

    disk {
        label = "disk1"
        size  = 500
    }

}
