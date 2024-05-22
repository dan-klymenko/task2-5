VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
get:
	go get
darwin: get
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -v -o task2-5 -ldflags "-X="github.com/dan-klymenko/task2-5/cmd.appVersion=${VERSION}
