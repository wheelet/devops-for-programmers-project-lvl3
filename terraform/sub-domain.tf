resource "digitalocean_domain" "record" {
  name       = "terraform.wheelet.me"
  ip_address = digitalocean_loadbalancer.loadbalancer.ip
}
