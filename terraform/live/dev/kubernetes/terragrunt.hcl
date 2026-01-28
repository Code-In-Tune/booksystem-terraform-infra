terraform {
  source = "../../../modules/kubernetes"
}

include "root" {
  path = find_in_parent_folders()
  expose = true
}

### With this configuration in input, node will be accessible from http://localhost:8080
### (Once ingress and nginx has been configured to route to appropriate services)

inputs =  {
  cluster_name = include.root.locals.cluster_name
  cluster_host_port = include.root.locals.cluster_host_port
  cluster_port = include.root.locals.cluster_port
  cluster_host_listen_address = include.root.locals.cluster_host_listen_address
}