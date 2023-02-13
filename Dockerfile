# Builder
FROM golang:1.20 AS builder
WORKDIR /go/src/app
COPY . .
RUN go build -ldflags="-w -s"

# Runner
FROM gcr.io/distroless/static-debian11
COPY --from=builder /go/src/app/debug-go-docker /
CMD ["/debug-go-docker"]
