SERVICE="openmrs.service"
if pgrep -x "$SERVICE" >/dev/null
then
            echo "$SERVICE is running"
    else
                echo "$SERVICE stopped"
                    sudo service openmrs start
                          
fi


