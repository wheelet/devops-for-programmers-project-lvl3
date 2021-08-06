resource "digitalocean_droplet" "droplet-1" {
  count    = 2
  image    = "docker-20-04"
  name     = "web-terraform-project-${count.index + 1}"
  region   = "ams3"
  size     = "s-1vcpu-1gb"
  ssh_keys = [data.digitalocean_ssh_key.ssh.id]
}
