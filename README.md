# Dubbo to Rest

## 环境

- java 8

## 1. 说明  

演示通过 Pipy 实现 Rest 转 Dubbo 的协议网关。  
演示通过 Sidecar Outbound/Inbound, 实现 TCP 连接之上的 mTLS 数据传输。
示意图：  

![ ](https://github.com/wanpf/rest2dubbo_mtls/assets/2276200/8bde2ee5-fe00-47f1-b266-3ba2ee095df8)

## 2. 启动相关服务

依次启动如下5个服务：  

```bash
# 启动 Pipy proxy
./1-start-rest2dubbo.sh
./2-start-sidecar_outbound.sh
./3-start-sidecar_inbound.sh
./4-start-bookwarehouse.sh
./5-start-bookstore.sh
```

## 3. 使用 curl 测试  

测试一：  

```bash
curl -v 'http://127.0.0.1:8888/v1/getBook' --header 'Content-Type: application/json' --data  '{"id": 1}'
```

结果：  

```bash
{
  "date": "2024-01-18T02:08:59.119Z",
  "isbn": "9787517054221",
  "author": "Flomesh",
  "name": "Pipy 入门",
  "value": 0,
  "id": "1"
}
```

测试二：  

```bash
curl -v 'http://127.0.0.1:8888/v1/getBook' --header 'Content-Type: application/json' --data '{"id": 2}'
```

结果：  

```bash
{
  "date": "2024-01-18T02:08:59.126Z",
  "isbn": "9787517054222",
  "author": "Flomesh",
  "name": "Pipy 从入门到放弃",
  "value": 0,
  "id": "2"
}
```

测试一：  

```bash
curl -v 'http://127.0.0.1:8888/v1/getBook' --header 'Content-Type: application/json' --data  '{"id": 3}'
```

结果:

```bash
{
  "date": "2024-01-18T02:08:59.126Z",
  "isbn": "9787517054223",
  "author": "Flomesh",
  "name": "FSM 入门",
  "value": 0,
  "id": "3"
}
```
