package com.share.tks;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.share.tks.*.dao")
public class TksApplication {

	public static void main(String[] args) {
		SpringApplication.run(TksApplication.class, args);
	}
}
