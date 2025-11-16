# Creation of the Cluster in kind

resource "kind_cluster" "this" {
  name           = var.cluster_name
  wait_for_ready = true
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

# Creation of kubernetes provider

provider "kubernetes" {
  host                   = kind_cluster.this.endpoint
  client_certificate     = kind_cluster.this.client_certificate
  client_key             = kind_cluster.this.client_key
  cluster_ca_certificate = kind_cluster.this.cluster_ca_certificate
}

# Creation of helm for deployment as code provider

provider "helm" {
  kubernetes = {
    host                   = kind_cluster.this.endpoint
    client_certificate     = kind_cluster.this.client_certificate
    client_key             = kind_cluster.this.client_key
    cluster_ca_certificate = kind_cluster.this.cluster_ca_certificate
  }
}