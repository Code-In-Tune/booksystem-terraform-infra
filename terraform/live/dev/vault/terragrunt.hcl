terraform {
  source = "../../../modules/vault"
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
  vault_name = include.root.locals.vault_name
  vault_repository = include.root.locals.vault_repository
  vault_chart = include.root.locals.vault_chart
  vault_version = include.root.locals.vault_version
}