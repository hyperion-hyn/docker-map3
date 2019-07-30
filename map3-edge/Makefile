.PHONY: build

build:
	docker-compose -f docker-compose.yml -f docker-compose.build.yml build

push-to-dockerhub:
	cat docker-compose.yml | grep image | sed 's/^[ ]*image://' | sed -n '/map3/p' | xargs -I{} docker push {}

push-to-s3:
	aws s3 cp --acl public-read ./install.sh s3://hyperion-deploy/edge/install.sh
	aws s3 cp --acl public-read ./docker-compose.yml s3://hyperion-deploy/edge/docker-compose.yml
	tar zcvf depends.tar.gz --exclude '.DS_Store' config/ public_html/
	aws s3 cp --acl public-read ./depends.tar.gz s3://hyperion-deploy/edge/depends.tar.gz

publish: build push-to-dockerhub push-to-s3

run:
	docker-compose down --remove-orphans && docker-compose up --remove-orphans

dev: build
	docker-compose down --volumes --remove-orphans && docker-compose up --remove-orphans

clean:
	rm config.tar.gz
