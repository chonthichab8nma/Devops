terraform { 
  required_providers { 
    docker = { 
      source  = "kreuzwerker/docker" 
      version = "3.0.2" 
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.3"
    } 
  } 
} 

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "null_resource" "execute_script" {
  provisioner "local-exec" {
    command = "sh ./buildImg.sh"
   // working_dir = "${path.module}"
  }
}

resource "docker_image" "my_app" {
  name = "my-nginx-image:latest"
  depends_on = [null_resource.execute_script]
}

resource "docker_container" "my_container" {
  name = "my-nginx-container"
  image = docker_image.my_app.name
  ports {
    internal = 80
    external = 80
  }
}