
清理volumes并编译镜像运行
````
docker system prune --volumes && docker-compose down --remove-orphans && docker-compose up --build
````

编译镜像并执行
````
docker-compose down --remove-orphans && docker-compose up --build
````

拉取镜像并执行
````
docker-compose down --remove-orphans && docker-compose up --no-build
````

