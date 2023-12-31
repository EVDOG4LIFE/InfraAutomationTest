provider "bigip" {
    address  = var.bigip_host
    username = var.bigip_user
    password = var.bigip_password
}

resource "bigip_ltm_pool" "pool" {
    name = "/Common/terraform-pool"
    // ... other pool properties
}

resource "bigip_ltm_node" "node" {
    count = length(var.node_addresses)
    name = "/Common/node-${count.index}"
    address = var.node_addresses[count.index]
}

resource "bigip_ltm_pool_attachment" "attach_node" {
    count = length(var.node_addresses)
    pool = bigip_ltm_pool.pool.name
    node = "${bigip_ltm_node.node.*.name[count.index]}:443"
}
