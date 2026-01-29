# Terraform/Terragrunt Project
Terragrunt/Terraform modules to provision a local Kind cluster and deploy platform tooling (ingress-nginx, grafana, argocd, keycloak, vault)

## Objectives

* Deploy a cluster kind
* Layerization with terragrunt/terraform modules
* Declarative deploy of platform tooling
* Centralized routing (ingress and nginx modules)

## Architecture

| Componente    | Namespace     | Exposure            |
| ------------- |---------------|---------------------|
| ingress-nginx | infra         | NodePort/Ingress    |
| grafana       | observability | Ingress (/grafana)  |
| argocd        | infra         | Ingress (/argocd)   |
| keycloak      | auth          | Ingress (/keycloak) |
| vault         | auth          | Ingress (/)         |


## Quickstart

Run `terragrunt run-all apply` inside `terraform/live/dev`.
To destroy the infrastructure, run `terragrunt run-all destroy` inside the same folder.