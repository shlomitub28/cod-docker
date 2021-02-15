COD Docker
===============

This configuration builds a docker container to run HBase ,
Zookeeper and Apache Phoenix.



Build Image
-----------

    $ docker build -t shlomitub28/cod-docker .


Pull image
----------

If you want to pull the image already built then use this

    $ docker pull shlomitub28/cod-docker

More details at https://hub.docker.com/r/shlomitub28/cod-docker


Run COD docker
---------

    $ docker run  --expose 16010 -p 16010:16010  -d -h "cod-docker"  --name cod shlomi:cod
