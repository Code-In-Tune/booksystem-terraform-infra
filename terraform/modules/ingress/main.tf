resource "kubernetes_ingress_v1" "auth" {
  metadata {
    name      = "auth-ingress"
    namespace = var.auth_namespace_name
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      host = "localhost"

      http {
        path {
          path      = var.keycloak_path
          path_type = "Prefix"
          backend {
            service {
              name = "keycloak"
              port { number = 80 }
            }
          }
        }
      }
    }

    rule {
      host = "localhost"

      http {
        path {
          path      = var.vault_path
          path_type = "Prefix"
          backend {
            service {
              name = "vault"
              port { number = 8200 }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "observability" {
  metadata {
    name      = "observability-ingress"
    namespace = var.observability_namespace_name
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      host = "localhost"

      http {
        path {
          path      = var.grafana_path
          path_type = "Prefix"
          backend {
            service {
              name = "grafana"
              port { number = 80 }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "infra" {
  metadata {
    name      = "nginx"
    namespace = var.infra_namespace_name
  }

  spec {
    ingress_class_name = "nginx"

    rule {

      host = "localhost"

      http {
        path {
          path      = var.argocd_path
          path_type = "Prefix"

          backend {
            service {
              name = "argocd-server"

              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}