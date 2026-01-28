# Creation of the Cluster in kind

resource "kind_cluster" "this" {
  name           = var.cluster_name
  kind_config {
    node {
      role = "control-plane"

      # Creation of port mapping for outside kind

      extra_port_mappings {
        container_port = var.cluster_port    ############# Exposes Cluster port
        host_port      = var.cluster_host_port ########### Exposes port on host
        listen_address = var.cluster_host_listen_address # Exposes on given host
      }
    }
    api_version = "kind.x-k8s.io/v1alpha4"
    kind        = "Cluster"
  }
}