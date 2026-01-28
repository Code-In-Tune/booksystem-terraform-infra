resource "helm_release" "vault" {
  name       = var.vault_name
  namespace  = var.auth_namespace_name
  repository = var.vault_repository
  chart      = var.vault_chart
  version    = var.vault_version

  values = [
    yamlencode({
      server = {
        ha = {
          enabled : false
          standalone = {
            enabled : true
          }
        }
      }
    })
  ]
}