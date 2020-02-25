resource "kubernetes_ingress" "nodeapp_ingress" {
  metadata {
    name = "nodeapp-ingress"
  }

  spec {
    backend {
      service_name = "nodeappapi-service"
      service_port = "${kubernetes_service.nodeapp_service.spec.0.port.0.port}"
    }

    rule {
      http {
        path {
          backend {
            service_name = "nodeappapi-service"
            service_port = "${kubernetes_service.nodeapp_service.spec.0.port.0.port}"
          }

          path = "/*"
        }
      }
    }
  }
}
