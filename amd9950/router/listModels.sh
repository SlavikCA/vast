curl -s "https://direct9950.acloud.app/v1/models" \
 -H "Content-Type: application/json" \
 -H "X-Api-Key: ???" | jq -r '.data[].id'
