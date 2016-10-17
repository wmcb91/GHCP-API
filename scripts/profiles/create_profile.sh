#!/bin/bash

curl --include --request POST http://localhost:3000/profiles \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=BAhJIiU0MDJhNDIxMTRmZWM2NTM1NTBjMjQyYjg4ZTBlNjQ5NwY6BkVG--0386c9efa8348465c62b26b6ea0ac29864ea6c7e" \
  --data '{
    "profile": {
      "given_name": "Will",
      "surname": "Williams",
      "home_course": "Concord CC",
      "user_id": 3
    }
  }'
