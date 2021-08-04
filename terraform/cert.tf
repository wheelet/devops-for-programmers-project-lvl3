resource "digitalocean_certificate" "cert" {
  name    = "asdcert"
  type    = "lets_encrypt"
  domains = ["terraform.wheelet.me"]

  lifecycle {
    create_before_destroy = true
  }
}
