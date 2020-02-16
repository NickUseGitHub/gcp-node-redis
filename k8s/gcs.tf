terraform {
  backend "gcs" {
    bucket      = "trf-start-bucket"
    prefix      = "terraform"
    credentials = "${file(var.credentials)}"
  }
}
