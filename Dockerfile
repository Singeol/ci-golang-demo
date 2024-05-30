FROM mirror.gcr.io/golang:alpine AS build
WORKDIR /build
COPY . .
RUN apk add --no-cache make && make build

FROM mirror.gcr.io/alpine:latest
WORKDIR /
COPY --from=build /build/build /app
ENTRYPOINT ["/app/main"]