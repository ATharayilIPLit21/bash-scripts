SERVICE="odoo"
if pgrep -x "$SERVICE" >/dev/null
then
            echo "$SERVICE is running"
    else
                echo "$SERVICE stopped"
                    # uncomment to start odoo if stopped
                          sudo service odoo restart
                         #sudo service odoo status
                          sudo service postgresql-9.6 restart
                         #sudo service postgresql-9.6 status
                          #mail
fi

