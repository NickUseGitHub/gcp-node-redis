resource "kubernetes_deployment" "nodeappapi" {
  metadata {
    name = "nodeappapi"
    labels = {
      app = "nodeappapi"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nodeappapi"
      }
    }

    template {
      metadata {
        labels = {
          app = "nodeappapi"
        }
      }

      spec {
        container {
          image = "asia.gcr.io/trf-starter/node-redis:v1"
          name  = "node-redis"
          port {
            container_port = 3000
          }

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
        }
      }
    }
  }
}
