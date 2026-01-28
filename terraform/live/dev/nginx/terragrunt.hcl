terraform {
  source = "../../../modules/nginx"
}

include "root" {
  path = find_in_parent_folders()
  expose = true
}

dependency "kubernetes" {
  config_path = "../kubernetes"
  skip_outputs = true
}

dependencies {
  paths = ["../namespace", "../kubernetes"]
}

dependency "namespace" {
  config_path = "../namespace"
  skip_outputs = true
}

inputs = {
  # kubernetes_host                   = dependency.kubernetes.outputs.kubernetes_host
  # kubernetes_client_certificate     = dependency.kubernetes.outputs.kubernetes_client_certificate
  # kubernetes_client_key             = dependency.kubernetes.outputs.kubernetes_client_key
  # kubernetes_cluster_ca_certificate = dependency.kubernetes.outputs.kubernetes_cluster_ca_certificate
  app_namespace_name = include.root.locals.app_namespace_name
  observability_namespace_name = include.root.locals.observability_namespace_name
  auth_namespace_name = include.root.locals.auth_namespace_name
  infra_namespace_name = include.root.locals.infra_namespace_name
  nginx_name = include.root.locals.nginx_name
  nginx_repository= include.root.locals.nginx_repository
  nginx_chart = include.root.locals.nginx_chart
  nginx_version = include.root.locals.nginx_version
  nginx_controller_host_port_ports_http = include.root.locals.nginx_controller_host_port_ports_http
}