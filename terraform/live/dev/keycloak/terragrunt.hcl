terraform {
  source = "../../../modules/keycloak"
}

include "root" {
  path = find_in_parent_folders()
  expose = true
}

dependencies {
  paths = ["../namespace", "../kubernetes", "../nginx"]
}

inputs = {
  app_namespace_name = include.root.locals.app_namespace_name
  observability_namespace_name = include.root.locals.observability_namespace_name
  auth_namespace_name = include.root.locals.auth_namespace_name
  infra_namespace_name = include.root.locals.infra_namespace_name
  keycloak_name = include.root.locals.keycloak_name
  keycloak_repository = include.root.locals.keycloak_repository
  keycloak_chart = include.root.locals.keycloak_chart
  keycloak_version = include.root.locals.keycloak_version
}