# Docker Service Rebirth Example

1. 构建一个容器镜像，包含我们的服务程序。

```bash
docker build -t soulteary/docker-rebirth-example .
```

2. 将服务使用 Docker 跑起来。

```bash
docker compose up -d
```

3. 手动检查服务运行状态。

```bash
docker ps
```

如果服务正在启动，那么你将看到类似下面的 `starting` 的状态：

```bash
CONTAINER ID   IMAGE                              COMMAND                   CREATED         STATUS                            PORTS                    NAMES
00e196f18dec   soulteary/docker-rebirth-example   "./docker-service-re…"   5 seconds ago   Up 4 seconds (health: starting)   0.0.0.0:8080->8080/tcp   docker-service-rebirth-example-example-1
```

当服务启动正常，容器检测 `/health` 接口就绪时候，我们会得到 `healthy` 状态：

```bash
CONTAINER ID   IMAGE                              COMMAND                   CREATED          STATUS                    PORTS                    NAMES
00e196f18dec   soulteary/docker-rebirth-example   "./docker-service-re…"   33 seconds ago   Up 32 seconds (healthy)   0.0.0.0:8080->8080/tcp   docker-service-rebirth-example-example-1
```

4. 模拟 Crash 异常

访问 `http://localhost:8080/mock-crash`，会让服务出现异常，进程退出。

此时，再重复第二步和第三步，那么你将会发现程序在“自动复活”。
