APP="waybar"

PID=$(pgrep $APP)

if [ $? -eq 1 ]
then
    echo "$APP is not running"
    waybar
else
    echo "$APP is running"
    pkill -f waybar
fi
