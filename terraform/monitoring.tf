resource "datadog_monitor" "healthcheck" {
  name    = "Alert ! {{ host.name }}"
  type    = "service check"
  message = " @wheelet1228@gmail.com"

  query = "\"http.can_connect\".over(\"host:web-terraform-project-02\",\"url:http://localhost:80\").by(\"host\",\"instance\",\"url\").last(2).count_by_status()"
}
