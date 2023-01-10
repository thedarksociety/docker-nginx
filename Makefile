#
# The Dark Society
# Nginx Images
# Version 2.0.0
#
SHELL := /bin/bash

PROJECT_ID := $(shell gcloud config get-value project)
PROJECT_USER := $(shell gcloud config get-value core/account)
PROJECT_NUMBER := $(shell gcloud projects describe ${PROJECT_ID} --format="value(projectNumber)")
PROJECT_REGION := "us-west3"


build:
	@docker build \
		-f 1.19/Dockerfile \
		-t ${PROJECT_REGION}-docker.pkg.dev/tdsc-containers/nginx/1.19:0.0.1 \
		./1.19/



test:
	@echo "${PROJECT_ID}"
	@echo "${PROJECT_USER}"
	@echo "${PROJECT_NUMBER}"

gcloud-project:
	@echo "should this auto change projects?"

deploy:
	@docker push ${PROJECT_REGION}-docker.pkg.dev/tdsc-containers/nginx/1.19:0.0.1

