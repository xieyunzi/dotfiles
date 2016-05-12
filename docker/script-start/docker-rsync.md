mac 上同步 host 2 docker-machine

```bash
docker run -it -v /rsync/tmp:/rsync/tmp rails:5.0.0.rc1 /bin/bash
docker-rsync -dst /rsync/tmp/project-name -src /code/project-name -verbose xyz
```
