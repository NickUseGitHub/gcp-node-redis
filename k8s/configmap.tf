resource "kubernetes_config_map" "nodeapi_env" {
  metadata {
    name = "nodeapi-config"
  }

  data = {
    PORT        = "3000"
    APP_VERSION = "V2 Nick naja"
  }
}
