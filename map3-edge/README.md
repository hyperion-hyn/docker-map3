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
make dev
````

### build and run
````
make build && make run
````

### pull and run
````
make run
````

# Development
## Docker Hub
### Login
````
docker login -u <USER>
````
### Build
````
make build
````
### Push
````
make push-to-dockerhub
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
make push-to-s3
````


