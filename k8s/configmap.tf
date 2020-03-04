resource "kubernetes_config_map" "nodeapi_env" {
  metadata {
    name = "nodeapi-config"
  }

  data = {
    PORT        = "3000"
    APP_VERSION = "V2 Nick naja"
  }
}

resource "kubernetes_config_map" "nginx_conf" {
  metadata {
    name = "nginx-config"
  }

  data = {
    "nginx.conf" = "${file(var.nginx_conf_pathfile)}"
  }
}
