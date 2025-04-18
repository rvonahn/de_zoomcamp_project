variable "credentials" {
  description = "My Credentials"
  default     = "./keys/de-zoomcamp-project-455418-86e16c31e05b.json"
  #ex: if you have a directory where this file is called keys with your service account json file
  #saved there as my-creds.json you could use default = "./keys/my-creds.json"
}


variable "project" {
  description = "Project"
  default     = "de-zoomcamp-project-455418"
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default     = "US"
}

variable "bq_dataset_name" {
  description = "Spotify_Million_Playlists"
  #Update the below to what you want your dataset to be called
  default     = "de-zoomcamp-project-455418_spotifymillionpl"
}

variable "gcs_bucket_name" {
  description = "Spotify_Million_Playlists"
  #Update the below to a unique bucket name
  default     = "de-zoomcamp-project-455418_spotifymillionpl"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}