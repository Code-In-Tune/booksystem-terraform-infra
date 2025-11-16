terraform {
  source = "../../../modules/kubernetes"
}

dependencies {
  paths = [] ## No dependencies, core modules
}

### With this configuration in input, node will be accessible from http://localhost:8080
### (Once ingress and nginx has been configured to route to appropriate services)

inputs =  {
  cluster_name = "book-system-cluster"
  cluster_host_port = 8080
  cluster_port = 80
  cluster_host_listen_address = "127.0.0.1"
}