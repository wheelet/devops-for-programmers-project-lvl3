resource "digitalocean_record" "record" {
  domain     = "wheelet.me"
  type       = "A"
  name       = "terraform"
  value      = digitalocean_loadbalancer.loadbalancer.ip
}
