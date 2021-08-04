resource "digitalocean_domain" "default" {
  name       = "terraform.wheelet.me"
  ip_address = digitalocean_loadbalancer.loadbalancer.ip
}
