# https://codelabs.developers.google.com/codelabs/cpb101-bigquery-dataflow-sideinputs/

SELECT
  content
FROM
  [fh-bigquery:github_extracts.contents_java_2016]
LIMIT
  10


# Step 2
SELECT
  COUNT(*)
FROM
  [fh-bigquery:github_extracts.contents_java_2016]
