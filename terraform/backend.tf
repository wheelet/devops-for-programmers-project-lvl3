terraform {
  backend "remote" {
    organization = "devops-example"

    workspaces {
      name = "asd"
    }
  }
}
