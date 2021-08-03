resource "digitalocean_certificate" "cert" {
  name    = "cert"
  type    = "lets_encrypt"
  domains = ["terraform.wheelet.me"]
}
