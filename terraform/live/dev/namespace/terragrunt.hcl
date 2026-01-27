terraform {
  source = "../../../modules/namespace"
}

dependency "kubernetes" {
  config_path = "../kubernetes"
}

inputs = {
  kubernetes_host                   = dependency.kubernetes.outputs.kubernetes_host
  kubernetes_client_certificate     = dependency.kubernetes.outputs.kubernetes_client_certificate
  kubernetes_client_key             = dependency.kubernetes.outputs.kubernetes_client_key
  kubernetes_cluster_ca_certificate = dependency.kubernetes.outputs.kubernetes_cluster_ca_certificate
  app_namespace_name = "app"
  observability_namespace_name = "observability"
  auth_namespace_name = "auth"
  infra_namespace_name = "infra"
}