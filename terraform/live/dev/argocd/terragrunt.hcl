terraform {
  source = "../../../modules/argocd"
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
  paths = ["../namespace", "../kubernetes", "../nginx"]
}

dependency "namespace" {
  config_path = "../namespace"
  skip_outputs = true
}

inputs = {
  app_namespace_name = include.root.locals.app_namespace_name
  observability_namespace_name = include.root.locals.observability_namespace_name
  auth_namespace_name = include.root.locals.auth_namespace_name
  infra_namespace_name = include.root.locals.infra_namespace_name
  argocd_admin_password_bcrypt = include.root.locals.argocd_admin_password_bcrypt
  argocd_version = include.root.locals.argocd_version
  argocd_name = include.root.locals.argocd_name
  argocd_repository = include.root.locals.argocd_repository
  argocd_chart = include.root.locals.argocd_chart
  argocd_path = include.root.locals.argocd_path
}