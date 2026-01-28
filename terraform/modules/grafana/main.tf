resource "helm_release" "grafana" {
  name       = var.grafana_name
  repository = var.grafana_repository
  chart      = var.grafana_chart
  namespace  = var.observability_namespace_name
  version    = var.grafana_version


  values = [
    yamlencode({
      adminUser     = "admin"
      adminPassword = "admin"

      service = {
        type = "ClusterIP"
        port = 80
      }

      "grafana.ini" = {
        server = {
          root_url : var.grafana_root_url
          serve_from_sub_path : true
          domain : "localhost"
        }
      }
    })
  ]
}