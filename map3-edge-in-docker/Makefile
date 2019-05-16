
.PHONY: build deploy

build:
	docker-compose build

deploy:
	docker tag map3/deploy-edge:latest docker.io/map3/deploy-edge
	docker push docker.io/map3/deploy-edge
