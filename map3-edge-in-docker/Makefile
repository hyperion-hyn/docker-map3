
.PHONY: build deploy

build:
	docker-compose build

deploy:
	docker tag map3/deploy-edge-nsa:latest docker.io/map3/deploy-edge-nas
	docker push docker.io/map3/deploy-edge-nas
