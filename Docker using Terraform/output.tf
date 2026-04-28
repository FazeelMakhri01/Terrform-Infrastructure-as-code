output "docker" {
  value = docker_container.nginx
  description = "This output will show the details of the nginx container that we created using Terraform. It will include information such as the container ID, image ID, and the ports that are mapped to the host machine."  
}