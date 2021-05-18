# dockerimage-minio-agent

```bash
docker image pull registry.cn-shanghai.aliyuncs.com/yingzhuo/minio-agent:latest
```

#### Run this shit

```bash
docker container run \
  --name=ma \
  -p 8080:8080 \
  -d \
  registry.cn-shanghai.aliyuncs.com/yingzhuo/minio-agent:latest \
  /bin/entrypoint.sh \
  --minio.endpoint="http://192.168.10.115:9000" \
  --minio.access-key="minio" \
  --minio.secret-key="minio-minio"
```