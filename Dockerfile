# Stage 1: Build static Go binary
FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY hello.go .

RUN go build -ldflags="-s -w" -o hello hello.go

# Stage 2: Create minimal runtime image with real OS
FROM gcr.io/distroless/static-debian12

COPY --from=builder /app/hello /hello

ENTRYPOINT ["/hello"]