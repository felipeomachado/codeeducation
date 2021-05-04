FROM golang:1.15 as builder

WORKDIR /app

COPY main.go .

RUN go build main.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

CMD ["/app/main"]