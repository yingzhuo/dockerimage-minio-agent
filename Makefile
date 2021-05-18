timestamp		:= $(shell /bin/date '+%Y%m%d%H%M%S')

release-docker:
	@mvn -f $(CURDIR)/pom.xml clean package -P"docker"
	@docker login --username=yingzhor@gmail.com registry.cn-shanghai.aliyuncs.com
	@docker image build --tag registry.cn-shanghai.aliyuncs.com/yingzhuo/minio-agent $(CURDIR)/target/docker-context
	@docker image push registry.cn-shanghai.aliyuncs.com/yingzhuo/minio-agent
	@docker logout registry.cn-shanghai.aliyuncs.com

github:
	@git status
	@git add .
	@git commit -m "$(shell /bin/date "+%F %T")"
	@git push

.PHONY: release-docker github