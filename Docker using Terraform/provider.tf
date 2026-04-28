
#This is the Docker socket path on Mac/Linux, Terraform connects to your local Docker daemon using this Unix socket.
provider "docker" {
    host = "unix:///var/run/docker.sock"

}