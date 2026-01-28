locals {
  kubeconfig_path = "~/.kube/config"
  cluster_name = "book-system-cluster"
  cluster_host_port = 8080
  cluster_port = 80
  cluster_host_listen_address = "127.0.0.1"
  app_namespace_name = "app"
  observability_namespace_name = "observability"
  auth_namespace_name = "auth"
  infra_namespace_name = "infra"
  nginx_name = "ingress-nginx"
  nginx_repository= "https://kubernetes.github.io/ingress-nginx"
  nginx_chart = "ingress-nginx"
  nginx_version = "4.11.2"
  nginx_controller_host_port_ports_http = "80"
}