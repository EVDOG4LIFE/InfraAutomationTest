output "pool_name" {
    value = bigip_ltm_pool.pool.name
    description = "The name of the load balancer pool created"
}
