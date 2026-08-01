curl -s "https://direct5090.acloud.app/v1/models" \
 -H "Content-Type: application/json" \
 -H "X-Api-Key: ???" | jq -r '.data[].id'
