package com.mobileshop.entity;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FileEntity {

	// Upload files.
	private CommonsMultipartFile[] fileDatas;

	public CommonsMultipartFile[] getFileDatas() {
		return fileDatas;
	}

	public void setFileDatas(CommonsMultipartFile[] fileDatas) {
		this.fileDatas = fileDatas;
	}
}
