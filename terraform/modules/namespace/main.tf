# Provider required for namespaces

provider "kubernetes" {
  host                   = var.kubernetes_host
  client_certificate     = var.kubernetes_client_certificate
  client_key             = var.kubernetes_client_key
  cluster_ca_certificate = var.kubernetes_cluster_ca_certificate
}



# Namespaces kubernetes

resource "kubernetes_namespace_v1" "app" {
  metadata {
    name = var.app_namespace_name
  }
}
resource "kubernetes_namespace_v1" "observability" {
  metadata {
    name = var.observability_namespace_name
  }
}

resource "kubernetes_namespace_v1" "auth" {
  metadata {
    name = var.auth_namespace_name
  }
}

resource "kubernetes_namespace_v1" "infra" {
  metadata {
    name = var.infra_namespace_name
  }
}