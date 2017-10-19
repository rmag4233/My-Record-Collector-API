curl --include --request POST "http://localhost:4741/albums" \
  --header "Content-Type: application/json" \
  --data '{
    "album": {
      "title": "'"${TITLE}"'",
      "artist_name": "'"${ARTIST_NAME}"'",
      "year_released": "'"${YEAR_RELEASED}"'",
      "format": "'"${FORMAT}"'",
      "catalog_number": "'"${CATALOG_NUMBER}"'"
    }
  }'
