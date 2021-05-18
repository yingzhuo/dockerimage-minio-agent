package minio.agent;

import com.github.yingzhuo.spring.boot.minio.web.MinioObject;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
@SpringBootApplication
public class ApplicationBoot {

    public static void main(String[] args) {
        SpringApplication.run(ApplicationBoot.class, args);
    }

    @RequestMapping(path = "{bucket}/{object}")
    MinioObject get(
            @PathVariable("bucket") String bucket,
            @PathVariable("object") String object
    ) {
        return MinioObject.builder()
                .bucket(bucket)
                .object(object)
                .attachmentName(object)
                .build();
    }

}
