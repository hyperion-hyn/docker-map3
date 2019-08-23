
.PHONY: build deploy

build:
	docker-compose build ../

deploy:
	docker tag map3/deploy-edge:latest docker.io/map3/deploy-edge
	docker push docker.io/map3/deploy-edge

build-aliyun:
	docker build -t map3/deploy-edge-dind:aliyun-latest -f Dockerfile-aliyun ../

deploy-aliyun:
	docker tag map3/deploy-edge-dind:aliyun-latest docker.io/map3/deploy-edge-dind:aliyun-latest
	docker push docker.io/map3/deploy-edge-dind:aliyun-latest
