data "digitalocean_ssh_key" "ssh" {
  name = "asd"
}

resource "digitalocean_droplet" "droplet-1" {
  image = "docker-20-04"
  name = "web-terraform-project-01"
  region = "ams3"
  size = "s-1vcpu-1gb"
  ssh_keys = [data.digitalocean_ssh_key.ssh.id]
}

resource "digitalocean_droplet" "droplet-2" {
  image = "docker-20-04"
  name = "web-terraform-project-02"
  region = "ams3"
  size = "s-1vcpu-1gb"
  ssh_keys = [data.digitalocean_ssh_key.ssh.id]
}

resource "digitalocean_certificate" "cert" {
  name = "cert"
  type = "lets_encrypt"
  domains = [
    "terraform.wheelet.me"]
}

resource "digitalocean_loadbalancer" "loadbalancer" {
  name = "loadbalancer"
  region = "ams3"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 5000
    target_protocol = "http"
  }

  forwarding_rule {
    entry_port = 443
    entry_protocol = "https"

    target_port = 5000
    target_protocol = "http"

    certificate_id = digitalocean_certificate.cert.name
  }

  healthcheck {
    port = 5000
    protocol = "http"
    path = "/"
  }

  droplet_ids = [
    digitalocean_droplet.droplet-1.id,
    digitalocean_droplet.droplet-2.id
  ]
}

resource "digitalocean_domain" "record" {
  name = "terraform.wheelet.me"
  ip_address = digitalocean_loadbalancer.loadbalancer.ip
}
