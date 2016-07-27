start docker daemon
-------------------

    docker daemon -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock &

play with http proxy
--------------------

    HTTP_PROXY=http://192.168.1.1:3128/ docker pull busybox

get container ip
----------------

    docker inspect -f '{{ .NetworkSettings.IPAddress }}' container-name

mac 上同步 host 2 docker-machine
-----------------------------

    docker run -it -v /rsync/tmp:/rsync/tmp rails:5.0.0.rc1 /bin/bash
    docker-rsync -dst /rsync/tmp/project-name -src /code/project-name -verbose xyz

Remove all stopped containers.
------------------------------

    docker rm $(docker ps -a -q)

Remove all untagged images
--------------------------

    docker rmi $(docker images | grep "^<none>" | awk "{print \$3}")

http://jimhoskins.com/2013/07/27/remove-untagged-docker-images.html

Commit the changes you make to the container and then run it
------------------------------------------------------------

Get the container id using this command:

    docker ps

Commit changes to the container:

    docker commit <container_id> <repository_name>

Then run the container:

    docker run <repository_name>

How-to-share-my-docker-image-without-using-the-docker-hub
---------------------------------------------------------

Docker images are stored as filesystem layers. Every command in the Dockerfile creates a layer. You can also create layers by using `docker commit` from the command line after making some changes (via `docker run` probably).

These layers are stored by default under `/var/lib/docker`. While you could (theoretically) cherry pick files from there and install it in a different docker server, is probably a bad idea to play with the internal representation used by Docker.

When you push your image, these layers are sent to the registry (the docker hub registry, by default… unless you tag your image with another registry prefix) and stored there. When pushing, the layer id is used to check if you already have the layer locally or it needs to be downloaded. You can use `docker history` to peek at which layers (other images) are used (and, to some extent, which command created the layer).

As for options to share an image without pushing to the docker hub registry, your best options are:

- `docker save` an image or `docker export` a container. This will output a tar file to standard output, so you will like to do something like `docker save 'dockerizeit/agent' > dk.agent.lastest.tar`. Then you can use `docker load` or `docker import` in a different host.

- Host your own private registry. - **Outdated, see comments** <strike>See the [docker registry image][1]. We have built an [s3 backed registry][2] which you can start and stop as needed (all state is kept on the s3 bucket of your choice) which is trivial to setup. This is also an interesting way of watching what happens when pushing to a registry</strike>

- Use another registry like quay.io (I haven't personally tried it), although whatever concerns you have with the docker hub will probably apply here too.


  [1]: https://github.com/dotcloud/docker-registry
  [2]: https://github.com/1uptalent/docker-s3-registry

http://stackoverflow.com/questions/24482822/how-to-share-my-docker-image-without-using-the-docker-hub
