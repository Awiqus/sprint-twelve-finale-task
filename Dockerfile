FROM golang:1.25

WORKDIR /app

COPY . .

RUN go mod tidy

RUN go mod download

RUN CGO_ENABLED=0 COOS=linux GOARCH=amd64 go build -o /my_task_app

CMD ["/my_task_app"]