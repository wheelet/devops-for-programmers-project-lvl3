resource "digitalocean_loadbalancer" "loadbalancer" {
  name = "loadbalancer"
  region = "ams3"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 5000
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
