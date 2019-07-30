# Installation
## Installation script
to launch a map3 edge, you can use the install script using cURL:

````
curl -o- https://hyperion-deploy.s3-ap-southeast-1.amazonaws.com/edge/install.sh | sudo bash
````
or Wget:
````
wget -qO- https://hyperion-deploy.s3-ap-southeast-1.amazonaws.com/edge/install.sh | sudo bash
````

## Build from source

### clean volumes, build and run
````
docker-compose -f docker-compose.yml -f docker-compose.build.yml build && docker-compose down --volumes --remove-orphans && docker-compose up --remove-orphans 
````

### build and run
````
docker-compose -f docker-compose.yml -f docker-compose.build.yml build && docker-compose down --remove-orphans && docker-compose up --remove-orphans 
````

### pull and run
````
docker-compose pull && docker-compose down --remove-orphans && docker-compose up --remove-orphans
````
###
````
docker-compose down --remove-orphans && docker-compose up --remove-orphans
````

# Development
## Docker Hub
### Login
````
docker login -u <USER>
````
### Build
````
docker-compose -f docker-compose.yml -f docker-compose.build.yml build 
````
### Push
````
cat docker-compose.yml | grep image | sed 's/^[ ]*image://' | sed -n '/map3/p' | xargs -I{} docker push {}
````

## AWS
### Login
~/bin/aws-env.sh #!/bin/bash 
````
export AWS_PROFILE=$1
export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id --profile $1)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key --profile $1)
export AWS_DEFAULT_REGION=$(aws configure get region --profile $1)
export AWS_REGION=$(aws configure get region --profile $1)
````

````
source ~/bin/aws-env.sh <PROFILE>
````

#### Upload files
upload installation files to s3.
````
aws s3 cp --acl public-read ./install.sh s3://hyperion-deploy/edge/install.sh
aws s3 cp --acl public-read ./docker-compose.yml s3://hyperion-deploy/edge/docker-compose.yml
find ./config -type f -iname '*' ! -name '.DS_Store' | sed 's,\./,,' | xargs -I{} aws s3 cp --acl public-read ./{} s3://hyperion-deploy/edge/{}
````


