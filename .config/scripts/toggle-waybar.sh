APP="waybar"

# PID=$(pgrep $APP)
# check if hyprctl clients is running in full screen

# status_check

result="$(hyprctl activewindow -j | jq -r ".fullscreen")"
echo $result
if [ "$(hyprctl activewindow -j | jq -r ".fullscreen")" = "true" ];
then
    echo "Full screen mode active, killing waybar"
    pkill -f waybar
else
    echo "Full screen mode not active, starting waybar"
    waybar
fi
