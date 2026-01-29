terraform {
  source = "../../../modules/ingress"
}

include "root" {
  path = find_in_parent_folders()
  expose = true
}

dependencies {
  paths = [
    "../namespace",
    "../kubernetes",
    "../nginx",
    "../grafana",
    "../vault",
    "../argocd",
    "../keycloak"
  ]
}

inputs = {
  app_namespace_name = include.root.locals.app_namespace_name
  observability_namespace_name = include.root.locals.observability_namespace_name
  auth_namespace_name = include.root.locals.auth_namespace_name
  infra_namespace_name = include.root.locals.infra_namespace_name
  keycloak_path = include.root.locals.keycloak_path
  vault_path = include.root.locals.vault_path
  argocd_path = include.root.locals.argocd_path
  grafana_path = include.root.locals.grafana_path
}