locals {

  ####### Kubernetes locals #########

  kubeconfig_path = "~/.kube/config"
  cluster_name = "book-system-cluster"
  cluster_host_port = 8080
  cluster_port = 80
  cluster_host_listen_address = "127.0.0.1"

  ####### Namespace locals #########

  app_namespace_name = "app"
  observability_namespace_name = "observability"
  auth_namespace_name = "auth"
  infra_namespace_name = "infra"

  ####### Nginx locals #########

  nginx_name = "ingress-nginx"
  nginx_repository= "https://kubernetes.github.io/ingress-nginx"
  nginx_chart = "ingress-nginx"
  nginx_version = "4.11.2"
  nginx_controller_host_port_ports_http = "80"

  ####### Argocd locals #########

  argocd_admin_password_bcrypt = "$2y$10$ZD6Wipr02l0FipRf0NGu..9y1EWuMDQpjXZvxoK5H6OkHjMR8PF2O" #admin
  argocd_version = "5.35.0"
  argocd_name = "argocd"
  argocd_repository = "https://argoproj.github.io/argo-helm"
  argocd_chart = "argo-cd"
  argocd_path = "/argocd"

  ####### Grafana locals #########

  grafana_root_url = "http://localhost:8080/grafana/"
  grafana_name = "grafana"
  grafana_repository = "https://grafana.github.io/helm-charts"
  grafana_chart = "grafana"
  grafana_version = "8.6.0"

  ####### Vault locals #########

  vault_name = "vault"
  vault_repository = "https://helm.releases.hashicorp.com"
  vault_chart = "vault"
  vault_version = "0.28.0"
}