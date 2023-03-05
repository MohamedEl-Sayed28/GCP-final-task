provider "google" {
  credentials = file("muhammed-mahoud-0568452152bf.json")
  project     = var.project_id
  region      = var.region
}

