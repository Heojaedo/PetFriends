package com.spring.domain;

import lombok.Data;

@Data
public class UploadVO {

	private int filenum;
	private String postuid;
	private String filename;
	private String original;
	private int filesize;
	private String uploadtime;
}
