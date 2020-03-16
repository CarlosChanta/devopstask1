provider "google" {
  credentials = "${file("serviceaccount.json")}"
  project     = "true-server-269807"
  region      = "southamerica-east1-a"
}

resource "google_container_cluster" "gke-cluster" {
  name               = "apigcp-cluster"
  network            = "default"
  location           = "southamerica-east1-a"
  initial_node_count = 1
}