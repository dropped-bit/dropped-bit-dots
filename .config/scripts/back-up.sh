# back-up homefolder

date="$(date +%F)"
echo "Back-up generated on $date"

tar -czvf $HOME/backup_$date.tar.gz $HOME
