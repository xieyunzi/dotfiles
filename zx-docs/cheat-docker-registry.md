Deploying a registry server
===========================

Running on localhost
--------------------

Start your registry:

    docker run -d -p 5000:5000 --restart=always --name registry registry:2

You can now use it with docker.

Get any image from the hub and tag it to point to your registry:

    docker pull ubuntu && docker tag ubuntu localhost:5000/ubuntu

… then push it to your registry:

    docker push localhost:5000/ubuntu

… then pull it back from your registry:

    docker pull localhost:5000/ubuntu

To stop your registry, you would:

    docker stop registry && docker rm -v registry

Managing with Compose
---------------------

    registry:
      image: registry:2
      ports:
        - 127.0.0.1:5000:5000
      environment:
        REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY: /data
      volumes:
        - ./data:/data

https://docs.docker.com/registry/deploying/
