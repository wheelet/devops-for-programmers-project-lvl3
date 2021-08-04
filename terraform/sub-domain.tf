resource "digitalocean_domain" "default" {
  name       = "asd.wheelet.me"
  ip_address = digitalocean_loadbalancer.loadbalancer.ip
}
