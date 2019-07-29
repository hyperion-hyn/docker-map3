
clean volumes, build and run
````
docker-compose down --volumes --remove-orphans && docker-compose up --build --remove-orphans 
````

build and run
````
docker-compose down --remove-orphans && docker-compose up --build
````

pull and run
````
docker-compose down --remove-orphans && docker-compose up --no-build
````

