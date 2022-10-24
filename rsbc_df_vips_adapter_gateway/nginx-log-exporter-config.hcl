listen {
  port = 4040
  address = "0.0.0.0"
  metrics_endpoint = "/metrics"
}

consul {
  enable = false
}

namespace "vipsadapter" {
  format = "$remote_addr - $remote_user [$time_local] \"$request\" $status $body_bytes_sent \"$http_host\" \"$hostname\" \"$http_referer\" \"$http_user_agent\" \"$http_x_forwarded_for\""
  source {
    files = [
      "/var/log/nginx/vipsadapter/access.log"
    ]
  }

  # log can be printed to std out, e.g. for debugging purposes (disabled by default)
  print_log = false

  # metrics_override = { prefix = "myprefix" }
  # namespace_label = "vhost"

  labels {
    app = "vips-adapter"
    environment = "dev"
  }

  relabel "request_uri" {
    from = "request"
  }

  relabel "host" {
    from = "http_host"
  }

  relabel "request_path" {
    from = "request"
    split = 2
    separator = " " // (1)
  }

  histogram_buckets = [.005, .01, .025, .05, .1, .25, .5, 1, 2.5, 5, 10]
}
