resource "helm_release" "keycloak" {
  name       = var.keycloak_name
  namespace  = var.auth_namespace_name
  repository = var.keycloak_repository
  chart      = var.keycloak_chart
  version    = var.keycloak_version

  values = [
    yamlencode({
      httpRelativePath = "/keycloak/"
      image = {
        registry   = "docker.io"
        repository = "bitnamilegacy/keycloak"
      }

      postgresql = {
        image = {
          registry   = "docker.io"
          repository = "bitnamilegacy/postgresql"
        }
      }

      keycloakConfigCli = {

        image = {
          registry   = "docker.io"
          repository = "bitnamilegacy/keycloak-config-cli"
        }
      }
    })
  ]


  set {
      name  = "auth.adminUser"
      value = "admin"
    }

  set {
      name  = "auth.adminPassword"
      value = "admin"
    }

  set {
      name  = "service.type"
      value = "ClusterIP"
    }

  set {
      name  = "postgresql.enabled"
      value = "true"
    }

  set_list {
      name = "extraArgs"
      value = [
        "--hostname-strict=false",
        "--proxy=edge"
      ]
    }

  timeout = 600
  wait    = false
  atomic  = true
}