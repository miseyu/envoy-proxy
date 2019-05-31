NAME := envoy-proxy

.PHONY: docker-build
docker-build:
	docker build -t $(NAME) .