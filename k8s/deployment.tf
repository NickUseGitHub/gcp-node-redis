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
          image = "asia.gcr.io/trf-starter/node-redis:v2"
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

          readiness_probe {
            http_get {
              path = "/"
              port = 3000
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }

        }
      }
    }
  }
}

resource "kubernetes_service" "nodeapp_service" {
  metadata {
    name = "nodeappapi-service"
  }
  spec {
    selector = {
      app = "${kubernetes_deployment.nodeappapi.metadata.0.labels.app}"
    }
    session_affinity = "ClientIP"
    port {
      port        = 3000
      target_port = "${kubernetes_deployment.nodeappapi.spec.0.template.0.spec.0.container.0.port.0.container_port}"
    }

    type = "NodePort"
  }
}
