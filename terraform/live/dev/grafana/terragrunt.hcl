terraform {
  source = "../../../modules/grafana"
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
  grafana_root_url = include.root.locals.grafana_root_url
  grafana_name = include.root.locals.grafana_name
  grafana_repository = include.root.locals.grafana_repository
  grafana_chart = include.root.locals.grafana_chart
  grafana_version = include.root.locals.grafana_version
}