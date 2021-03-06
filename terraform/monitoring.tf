resource "datadog_monitor" "healthcheck" {
  name              = "Alert ! {{ host.name }}"
  type              = "service check"
  message           = " @wheelet1228@gmail.com"
  query             = "\"http.can_connect\".over(\"host:web-terraform-project-01\",\"host:web-terraform-project-02\").by(\"host\",\"instance\",\"url\").last(2).count_by_status()"
  notify_no_data    = true
  renotify_interval = 60
  notify_audit      = false
  timeout_h         = 60
}
