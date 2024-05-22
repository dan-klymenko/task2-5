VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETARCH=arm64
get:
	go get
arm: get
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -v -o task2-5 -ldflags "-X="github.com/dan-klymenko/task2-5/cmd.appVersion
windows: get
	CGO_ENABLED=0 GOOS=windows GOARCH=arm64 go build -v -o task2-5 -ldflags "-X="github.com/dan-klymenko/task2-5/cmd.appVersion
linux: get
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -v -o task2-5 -ldflags "-X="github.com/dan-klymenko/task2-5/cmd.appVersion
macos: get
	CGO_ENABLED=0 GOOS=macos GOARCH=arm64 go build -v -o task2-5 -ldflags "-X="github.com/dan-klymenko/task2-5/cmd.appVersion
image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}
clean:
	docker rmi task2-5
