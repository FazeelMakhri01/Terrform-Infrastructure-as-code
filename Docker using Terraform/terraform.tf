
#think of this as a which docker plugin we are using to interact with the docker engine. In this case we are using the kreuzwerker/docker plugin which is a terraform plugin that allows us to interact with the docker engine and manage our docker resources.
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}


