output "cluster_listen_address" {
  value = kind_cluster.this.kind_config[0].node[0].extra_port_mappings[0].listen_address
}

output "cluster_host_port" {
  value = kind_cluster.this.kind_config[0].node[0].extra_port_mappings[0].host_port
}