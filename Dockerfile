FROM golang:alpine AS BuildStage
WORKDIR /build
COPY . .
RUN apk add --no-cache make && make build

FROM alpine:latest
WORKDIR /
COPY --from=BuildStage /build/build /app
ENTRYPOINT ["/app/main"]