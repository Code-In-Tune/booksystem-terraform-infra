terraform {
  source = "../../../modules/namespace"
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
  paths = ["../kubernetes"]
}

inputs = {
  app_namespace_name = include.root.locals.app_namespace_name
  observability_namespace_name = include.root.locals.observability_namespace_name
  auth_namespace_name = include.root.locals.auth_namespace_name
  infra_namespace_name = include.root.locals.infra_namespace_name
}