APP=$(basename $(shell git remote get-url origin))
#REGISTRY=dockerhubusername
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETARCH=arm64
TARGETOS=linux

linux:
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o task2-5 -ldflags "-X="github.com/dan-klymenko/task2-5/cmd.appVersion=${VERSION}
arm:
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o task2-5 -ldflags "-X="github.com/dan-klymenko/task2-5/cmd.appVersion=${VERSION}

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	docker rmi <IMAGE_TAG>



