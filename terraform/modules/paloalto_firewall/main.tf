provider "panos" {
    hostname = var.hostname
    username = var.username
    password = var.password
    // ... other provider parameters as needed
}

resource "panos_ethernet_interface" "eth1" {
    name = "ethernet1/1"
    vsys = "vsys1"
    mode = "layer3"
    enable_dhcp = true
    comment = "Server Farm interface"

    lifecycle {
        create_before_destroy = true
    }
}

resource "panos_virtual_router" "vr" {
    name = "vr1"
    interfaces = [panos_ethernet_interface.eth1.name]
}

resource "panos_vlan" "vlan1" {
    name = "vlan1"
    vlan_interface = panos_layer3_subinterface.sub.name
    comment = "Server Farm VLAN"
}

resource "panos_security_rule_group" "web_access" {
    position_keyword = "top"
    rule {
        name = "allow_http_https"
        action = "allow"
        source_addresses = ["any"]
        destination_addresses = ["10.0.0.0/24"] // Server farm CIDR
        application = ["web-browsing", "ssl"]
    }
}
