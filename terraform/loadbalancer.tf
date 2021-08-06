resource "digitalocean_loadbalancer" "loadbalancer" {
  name   = "loadbalancer"
  region = "ams3"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = 80
    target_protocol = "http"

    certificate_name = digitalocean_certificate.cert.name
  }

  healthcheck {
    port     = 5000
    protocol = "http"
    path     = "/"
  }

  droplet_ids = [
    digitalocean_droplet.droplets.*.id,
  ]
}
