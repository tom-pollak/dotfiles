yabai -m query --spaces --space \
  | jq -re ".index" \
  | xargs -I{} yabai -m query --windows --space {} \
  | jq -sre "add | map(select(.minimized != 1)) | sort_by(.display, .frame.y, .frame.y, .id) | nth(index(map(select(.focused == 1))) - 1).id" \
  | xargs -I{} yabai -m window --focus {}
