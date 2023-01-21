package com.spring.domain;

import java.util.List;

import lombok.Data;

@Data
public class Post_ProfileVO {

	private int uid;
	private String title;
	private String photo;
	private String petsittername;
	private String price;
	private String filename;
	private List<UploadFileDTO> list;
	private int reviewCount;
}
