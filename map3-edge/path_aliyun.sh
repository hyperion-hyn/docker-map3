#!/bin/sh -e

sed -i "s/docker.elastic.co\/beats\/filebeat/registry.cn-hongkong.aliyuncs.com\/hyn-beats\/filebeat/" docker-compose.yml

sed -i "s/docker.elastic.co\/beats\/metricbeat/registry.cn-hongkong.aliyuncs.com\/hyn-beats\/metricbeat/" docker-compose.yml 