IMAGE := flask-py
TAG := latest

build: ## build the image
	docker build -t $(IMAGE):$(TAG) .

run: ## run in a local docker container
	docker run --rm -p 5000:5000 $(IMAGE):$(TAG)
