# Nginx release via helm

resource "helm_release" "nginx" {
  name             = var.nginx_name
  repository       = var.nginx_repository
  chart            = var.nginx_chart
  namespace        = var.infra_namespace_name
  version          = var.nginx_version

  timeout = 600
  wait    = false


  set {
      name  = "controller.hostPort.enabled"
      value = "true"
  }

  set  {
      name  = "controller.hostPort.ports.http"
      value = var.nginx_controller_host_port_ports_http
    }
}