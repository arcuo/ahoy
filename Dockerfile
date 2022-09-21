# GO base
FROM golang:1.19
WORKDIR /app

COPY go.mod .
COPY go.sum .
RUN go mod download -x

COPY *.go ./
COPY public/ ./public
COPY .env ./

# build
RUN go build -o main

# expose
EXPOSE 4444

# run
CMD ["/app/main"]
