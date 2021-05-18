# ----------------------------------------------------------------------------------------------------------------------
# 预构建
# ----------------------------------------------------------------------------------------------------------------------
ARG BASE_IMG=192.168.10.110/lib/java:8

FROM $BASE_IMG AS builder

WORKDIR /tmp

COPY *.jar app.jar

RUN java -Djarmode=layertools -jar /tmp/app.jar extract && \
    rm -rf /tmp/dependencies/BOOT-INF/lib/java-boot-jarmode-layertools-*.jar && \
    rm -rf /tmp/application/META-INF/maven && \
    rm -rf /tmp/application/BOOT-INF/classpath.idx && \
    rm -rf /tmp/application/BOOT-INF/layers.idx

# ----------------------------------------------------------------------------------------------------------------------
# 构建
# ----------------------------------------------------------------------------------------------------------------------
FROM $BASE_IMG

LABEL maintainer="应卓 <yingzhor@gmail.com>"

WORKDIR /opt

COPY --from=builder /tmp/dependencies/ ./
COPY --from=builder /tmp/spring-boot-loader/ ./
COPY --from=builder /tmp/snapshot-dependencies/ ./
COPY --from=builder /tmp/application/ ./
COPY --chown=root:root docker-entrypoint.sh /bin/entrypoint.sh

STOPSIGNAL 15

EXPOSE 8080

ENTRYPOINT ["sh", "/bin/entrypoint.sh"]