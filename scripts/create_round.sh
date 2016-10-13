#!/bin/bash

curl --include --request POST http://localhost:3000/rounds \
  --header "Authorization: Token token=BAhJIiVkZWNiMDlhNDg3MTBlOGJmYTZkZDA4MWZmOTU1MGU5MAY6BkVG--4ee4599c4f1660549e756a43807eb433c0622589" \
  --header "Content-Type: application/json" \
  --data '{
    "round": {
      "course": "Concord",
      "date_played": "2016-10-12",
      "par": 72,
      "profile_id": 8,
      "rating": 72,
      "score": 72,
      "slope": 120
    }
  }'
