options="Lock\nLog Out\nSuspend\nReboot\nShutdown"
my_dmenu="-b -i -nb '#2b3e50' -nf '#f8f8f2' -sb '#5c98cd' #adapt to whatever suits you
command=$(echo -e "$options" | eval dmenu "$my_dmenu")

case $command in
  "Lock" )
    ~/.i3/scripts/lock.sh
    ;;
  "Log Out" )
    i3-msg exit
    ;;
  "Suspend" )
    ~/.i3/scripts/lock.sh --suspend
    ;;
  "Reboot" )
    systemctl reboot
    ;;
  "Shutdown" )
    systemctl poweroff
    ;;
esac
