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