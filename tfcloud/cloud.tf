terraform {
  cloud {
    hostname = "app.terraform.io"
    organization = "Zen-Living"

    workspaces {
      name = "dev-ss"
    }
  }
}
