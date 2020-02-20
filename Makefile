APP?=kubest
PORT?=3000
PROJECT?=github.com/bmsandoval/kubest
CONTAINER_IMAGE?=docker.io/bmsandoval/${APP}
DEV_IMAGE?=docker.io/bmsandoval/go-build

RELEASE?=0.0.3

COMMIT?=$(shell git rev-parse --short HEAD)
BUILD_TIME?=$(shell date -u '+%Y-%m-%d_%H:%M:%S')
CURDIR?=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

GOOS?=linux
GOARCH?=amd64

local:
	helm upgrade --install dev-${APP} ./chart/kubest

remove:
	helm delete dev-${APP}

stop:
	minikube stop

start:
	minikube start --mount-string $(CURDIR):$(CURDIR) --mount --cpus 4 --memory 8192

mount:
	nohup minikube mount $(CURDIR):$(CURDIR) &

test:
	go test -v -race ./...

#.PHONY: charts
#all: charts
#
#charts:
#	cd chart && helm package kubest/
#	mv chart/*.tgz docs/
##	helm repo index docs --url https://alexellis.github.io/kubest/ --merge ./docs/index.yaml

