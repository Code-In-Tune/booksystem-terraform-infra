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
  argocd_admin_password_bcrypt = "$2y$10$ZD6Wipr02l0FipRf0NGu..9y1EWuMDQpjXZvxoK5H6OkHjMR8PF2O" #admin
  argocd_version = "5.35.0"
  argocd_name = "argocd"
  argocd_repository = "https://argoproj.github.io/argo-helm"
  argocd_chart = "argo-cd"
  argocd_path = "/argocd"
}