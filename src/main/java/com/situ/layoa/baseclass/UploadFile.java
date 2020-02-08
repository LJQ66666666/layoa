package com.situ.layoa.baseclass;

import java.io.Serializable;

import org.springframework.web.multipart.commons.CommonsMultipartFile;
/**
 * 文件上传的通用类
 * @author 14850
 *
 */
public class UploadFile implements Serializable {
	private static final long serialVersionUID = 1L;
	private CommonsMultipartFile uploadFile;
	public CommonsMultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(CommonsMultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
}
