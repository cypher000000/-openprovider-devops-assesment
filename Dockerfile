# syntax=docker/dockerfile:1
FROM golang:1.21-alpine AS builder
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o simplebank .

FROM alpine:3.21.3
WORKDIR /app
COPY --from=builder /app/simplebank .
COPY --from=builder /app/db/migrations ./db/migrations
COPY config/default.yaml ./config/default.yaml
COPY db/ ./db
EXPOSE 8080
CMD ["./simplebank"]
