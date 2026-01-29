resource "helm_release" "argocd" {
  name       = var.argocd_name
  repository = var.argocd_repository
  chart      = var.argocd_chart
  version    = var.argocd_version
  namespace  = var.infra_namespace_name

  set {
    name  = "configs.params.server\\.service.port"
    value = "80"
  }

  set {
    name  = "configs.params.server\\.service.targetPort"
    value = "80"
  }

  set {
    name  = "configs.params.server\\.service.type"
    value = "ClusterIP"
  }

  set {
    name  = "configs.params.server\\.insecure"
    value = "true"
  }

  set {
    name  = "configs.secret.argocdServerAdminPasswordMtime"
    value = timestamp()
  }

  set {
    name  = "configs.params.server\\.rootpath"
    value = var.argocd_path
  }

  set {
    name  = "configs.params.server\\.basehref"
    value = var.argocd_path
  }



  set_sensitive {
      name  = "configs.secret.argocdServerAdminPassword"
      value = var.argocd_admin_password_bcrypt
    }
}