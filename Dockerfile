FROM golang:1.21.5-alpine3.19 as builder
RUN echo '' > /etc/apk/repositories && \
    echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.19/main"         >> /etc/apk/repositories && \
    echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.19/community"    >> /etc/apk/repositories && \
    echo "Asia/Shanghai" > /etc/timezone
WORKDIR /build
ENV CGO_ENABLED=0
COPY . .
RUN go build -ldflags "-w -s"
EXPOSE 8080
CMD ["./docker-service-rebirth-example"]