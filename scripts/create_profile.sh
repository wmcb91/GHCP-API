#!/bin/bash

curl --include --request POST http://localhost:3000/profiles \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "profile": {
      "given_name": "Will",
      "surname": "Williams",
      "home_course": "Concord CC",
      "user_id": 3
    }
  }'
