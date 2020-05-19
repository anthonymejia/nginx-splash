SHELL := /bin/bash

all: build

build: # Build docker contaienr
	@docker build -t anthonymejia/nginx-splash .

push: # Push image to docker hub
	docker push anthonymejia/nginx-splash:latest

