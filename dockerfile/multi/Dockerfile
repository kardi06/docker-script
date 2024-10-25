FROM golang:1.18-alpine as builder

WORKDIR /app
COPY main.go ./
RUN go build -o /app/main main.go

FROM alphine:3.8
WORKDIR /app
COPY --FROM=builder /app/main ./
CMD /app/main