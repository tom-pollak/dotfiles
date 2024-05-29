yabai -m query --windows | jq -re --arg APP "$1" '
	map(select(.app == $APP and ."is-minimized" == false))
	| first as $recent
	| sort_by(.id)
	| length as $len
	| index(map(select(."has-focus" == true))) as $focused
	| if $focused | not then $recent.id elif $focused < $len - 1 then nth($focused + 1).id else nth(0).id end
' | xargs -I{} yabai -m window --focus {}
