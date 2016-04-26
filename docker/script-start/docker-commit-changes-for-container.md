# Commit the changes you make to the container and then run it

Get the container id using this command:

    docker ps

Commit changes to the container:

    docker commit <container_id> <repository_name>

Then run the container:

    docker run <repository_name>
