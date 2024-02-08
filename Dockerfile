FROM golang:alpine AS build
WORKDIR /build
COPY . .
RUN apk add --no-cache make && make build

FROM alpine:latest
WORKDIR /
COPY --from=build /build/build /app
ENTRYPOINT ["/app/main"]