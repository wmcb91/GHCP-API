#!/bin/bash

curl --include --request POST http://localhost:3000/rounds \
  --header "Authorization: Token token=BAhJIiU0MDJhNDIxMTRmZWM2NTM1NTBjMjQyYjg4ZTBlNjQ5NwY6BkVG--0386c9efa8348465c62b26b6ea0ac29864ea6c7e" \
  --header "Content-Type: application/json" \
  --data '{
    "round": {
      "course": "LETSGOOO",
      "date_played": "2016-10-12",
      "par": 72,
      "profile_id": 3,
      "rating": 72,
      "score": 72,
      "slope": 120
    }
  }'
