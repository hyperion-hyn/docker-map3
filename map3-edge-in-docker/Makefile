
.PHONY: build deploy

build:
	docker-compose build

deploy:
	docker tag hyn/deploy-map3-edge:latest docker.io/hyndocker/deploy-map3-edge:0.141421
	docker push docker.io/hyndocker/deploy-map3-edge:0.141421
