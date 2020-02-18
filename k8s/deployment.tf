resource "kubernetes_deployment" "node-app-api" {
  metadata {
    name = "node-app-api"
    labels = {
      app = "node-app-api"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "node-app-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "node-app-api"
        }
      }

      spec {
        container {
          image = "asia.gcr.io/trf-starter/node-redis:v1"
          name  = "node-redis"

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/nginx_status"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}
