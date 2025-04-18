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

Technologies Used:
-Cloud:  GCP
-IaC:  Terraform
-Orchestration:  Kestra
-Data Warehouse:  BigQuery
-Batch Processing:  DBT
-Dashboard:  Looker Studio
