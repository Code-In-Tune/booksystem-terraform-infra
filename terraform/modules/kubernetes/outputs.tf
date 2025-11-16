output "cluster_listen_address" {
  value = kind_cluster.this.kind_config.node.extra_port_mappings.listen_address
}

output "cluster_host_port" {
  value = kind_cluster.this.kind_config.node.extra_port_mappings.host_port
}