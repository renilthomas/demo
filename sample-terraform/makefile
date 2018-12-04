# Makefile

ROOT_DIR ?= $(CURDIR)
TF_BUCKET_REGION := us-east-1
DIR := $(shell pwd)

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply

update:
	terraform get -update

destroy:
	terraform destroy
