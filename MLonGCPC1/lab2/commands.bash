#!/bin/bash 


gcloud compute zones list
datalab create mydatalabvm --zone us-central1-a

# datalab connect --zone us-central1-a --port 8081 mydatalabvm

# webpreview::8081

# Ensure the Cloud Source Repositories API is enabled: 
# https://console.cloud.google.com/apis/library/sourcerepo.googleapis.com/?q=Repositories

# 
#standardSQL
SELECT
  departure_delay,
  COUNT(1) AS num_flights,
  APPROX_QUANTILES(arrival_delay, 5) AS arrival_delay_quantiles
FROM
  `bigquery-samples.airline_ontime_data.flights`
GROUP BY
  departure_delay
HAVING
  num_flights > 100
ORDER BY
  departure_delay ASC


#
#standardSQL
SELECT
  departure_airport,
  arrival_airport,
  COUNT(1) AS num_flights
FROM
  `bigquery-samples.airline_ontime_data.flights`
GROUP BY
  departure_airport,
  arrival_airport
ORDER BY
  num_flights DESC
LIMIT
  10
