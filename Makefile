VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

build:
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${shell dpkg --print-architecture} go build -v -o task2-5 -ldflags "-X="github.com/dan-klymenko/task2-5/cmd.appVersion=${VERSION}

clean:
	rm -rf task2-5
