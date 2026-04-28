

#pulling the docker image from the docker hub registry
resource "docker_image" "nginx" {
        name = "nginx:latest"  
}

#creating a docker container using the nginx image that we pulled from the docker hub registry
resource "docker_container" "nginx" {
        name = "nginx-container"
        image = docker_image.nginx.image_id
        ports {
                internal = 80
                external = 8080
        }

}


