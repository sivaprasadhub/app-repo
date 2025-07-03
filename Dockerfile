FROM golang:1.21-alpine3.18 AS builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /app/hello hello.go

FROM alpine:3.18
COPY --from=builder /app/hello /hello
ENTRYPOINT ["/hello"]
