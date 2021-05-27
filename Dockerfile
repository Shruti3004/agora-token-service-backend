# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang:alpine
RUN apk add git ca-certificates --update

# fetch dependancies github
RUN go get github.com/gin-gonic/gin
# RUN go get github.com/digitallysavvy/agora-token-server
ADD . /go/src/github.com/digitallysavvy/agora-token-server 

ENV APP_ID="6714b60932fb4ace8abedfb32cbf2bd0"
ENV APP_CERTIFICATE="e4a4d50445f44a0998a286b1706dd0dc"

# move to the working directory
WORKDIR $GOPATH/src/github.com/digitallysavvy/agora-token-server
# Build the token server command inside the container.
RUN go build
# RUN go run main.go
# Run the token server by default when the container starts.
ENTRYPOINT ./agora-token-server

# Document that the service listens on port 8080.
EXPOSE 8080