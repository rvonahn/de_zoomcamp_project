<h1>DE Zoomcamp Project Using the Spotify Million Playlist Dataset Challenge</h1>
Spotify at times releases a "Million Playlist" dataset to sample user trends for song recommendations and other analysis.  This is often linked to a challenge.  Information on the set and challenge can be found here:
https://www.aicrowd.com/challenges/spotify-million-playlist-dataset-challenge

This information is useful as you can see what the "top song" and "top artist" is to establish churn in music preferences of the general population.  For the Zoomcamp project, I will obtain this information.  For a later phase (this would be a v2, not included in this project), this can be compared to a subsequent Spotify set if/when the challenge reopens, Spotify API data on top plays or even an external souce loaded to the datasource such as the Billboard Top 100.

Problem:  Establish top song and artist by Spotify users to establish churn.

When a challenge is open, a script can be pointed to get the dataset directly, which is composed of 1000 different json slices.  Since the challenge is currently closed, the data must be obtained by a 3rd party site which also hosts the dataset.  Since this third party site requires registration and credentials and passes both a timestamp and key in the headers, anyone who wishes to recreate the project would need to register an account to login and obtain this data.

My source for the data is:  https://www.aicrowd.com/challenges/spotify-million-playlist-dataset-challenge
From the source, register, join the challenge then obtain the set from the "Resources" area.

Setting up this project came with some specific challenges - specifically around the best way to load the set.

It is downloaded as a 5gb Zip file which expands to approximately 37gb.  While there are different ways to unarchive and load to a bucket (or load to a bucket and unarchive), after trying out a few options, I elected to load the file into the Kestra namespace and use a flow to handle it.

The pipeline is Batch and would be loaded as new sets become available.

<ul>Technologies Used:
<li>Cloud:  GCP</li>
<li>IaC:  Terraform</li>
<li>Orchestration:  Kestra</li>
<li>Data Warehouse:  BigQuery</li>
<li>Batch Processing:  DBT</li>
<li>Dashboard:  Looker Studio</li>
</ul>

<h2>Setup guide</h2>

<h3>Prerequisites</h3>

1a. To run the project you will first need Terraform.
Terraform client installation: https://www.terraform.io/downloads

1b.  Next, you will need a cloud provider account, such as GCP.
https://console.cloud.google.com/
<ul>i.  Create a new project</ul>

1c.  Get your credentials from GCP.
<ul>i.  Create and download a service account (IAM & Admin>Service Accounts>Create Service Account)</ul>

1d.  Move the service account JSON file as downloaded to the following path.
<ul>i.  de_zoomcamp_project\terraform\keys</ul>

1e.  In terraform/main.tf, change variables in main.tf and variables.tf to match your destination as needed
<ul>i.  Run terraform init and apply</ul>

<h3>Datasource</h3>
2a. Navigate to https://www.aicrowd.com/challenges/spotify-million-playlist-dataset-challenge  

2b. Register  

2c. Join the challenge  

2d. Download the set from the "Resources" area.  

<h3>Orchestration</h3>
3a.  Open your Kestra instance (from a Docker Container or the Cloud)
Information on running Kestra, including sourcing a docker-compose file can be found here

3b.  If it doesn't exist already, create a namespace in Kestra labelled "zoomcamp"

3c.  Move the datasource where needed.  If Kestra is not mapped to pick up the data source from a cloud bucket or local directory, you can add it to the "files" section of the namespace in Kestra to get the project running quickly.

3d.  Add your credentials to the Kestra key, value store

3e.  Run the following flows to extract and convert the file and initialize dbt:

<ul>zoomcamp_gcp_kv_setup.yml</ul>
<ul>zoomcamp_gcp_resource_setup.yml</ul>
<ul>zoomcamp_gcp_bq_create_tables_r2.yml</ul>
<ul>zoomcamp_gcs_upload.yml</ul>
<ul>zoomcamp_gcs_transform_upload_data.yml</ul>
<ul>zoomcamp_cgcp_pull_bucket_json_make_parquet.yml</ul>
<ul>zoomcamp_dbt_build_r2.yml</ul>
	
4.  You can now connect datasource for dashboards in Looker Studio.
Example two panels:
<img src = https://github.com/rvonahn/de_zoomcamp_project/blob/main/de_zoomcamp_project_image.png>
