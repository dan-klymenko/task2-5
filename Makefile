VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
get:
	go get
arm: get
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -v -o task2-5 -ldflags "-X="github.com/dan-klymenko/task2-5/cmd.appVersion=${VERSION}
windows: get
	CGO_ENABLED=0 GOOS=windows GOARCH=arm64 go build -v -o task2-5 -ldflags "-X="github.com/dan-klymenko/task2-5/cmd.appVersion=${VERSION}
linux: get
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -v -o task2-5 -ldflags "-X="github.com/dan-klymenko/task2-5/cmd.appVersion=${VERSION}
macos: get
	CGO_ENABLED=0 GOOS=macos GOARCH=arm64 go build -v -o task2-5 -ldflags "-X="github.com/dan-klymenko/task2-5/cmd.appVersion=${VERSION}
