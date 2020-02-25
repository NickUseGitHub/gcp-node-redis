terraform {
  backend "gcs" {
    bucket      = "trf-start-bucket"
    prefix      = "terraform"
    credentials = "./credentials/trf-starter-key.json"
  }
}
