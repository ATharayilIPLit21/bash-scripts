CONTAINER="bahmni-std-cloud-package-master-openmrs-1"
if pgrep -x "$CONTAINER" >/dev/null
then
            echo "$CONTAINER is running"
    else
                echo "$SCONTAINER stopped"
                    sudo docker container start $CONTAINER
                          
fi

