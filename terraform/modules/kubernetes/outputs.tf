output "cluster_listen_address" {
  value = kind_cluster.this.kind_config[0].node[0].extra_port_mappings[0].listen_address
}

output "cluster_host_port" {
  value = kind_cluster.this.kind_config[0].node[0].extra_port_mappings[0].host_port
}

output "kubernetes_host" {
  value = kind_cluster.this.endpoint
}

output "kubernetes_client_certificate" {
  value = kind_cluster.this.client_certificate
}

output "kubernetes_client_key" {
  value = kind_cluster.this.client_key
}

output "kubernetes_cluster_ca_certificate" {
  value = kind_cluster.this.cluster_ca_certificate
}