FROM golang:1.21.6-alpine3.19 AS builder

WORKDIR /app

COPY . /app

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o helloworld .

FROM scratch

COPY --from=builder /app/helloworld .

CMD ["./helloworld"]
