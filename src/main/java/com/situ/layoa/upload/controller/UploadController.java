package com.situ.layoa.upload.controller;

import java.io.Serializable;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.layoa.baseclass.LayResult;
import com.situ.layoa.baseclass.UploadFile;
@Controller
public class UploadController implements Serializable {
	private static final long serialVersionUID = 1L;

	@ResponseBody
	@RequestMapping("/upload")
	public LayResult doUploadFile(UploadFile uploadFile) {
		System.out.println(uploadFile.getUploadFile());
		//将上传的文件写出到磁盘后得到一个文件到路径
		System.out.println("上传的文件是否为空"+uploadFile.getUploadFile().isEmpty());
		String src="layoafile/XXXXXXXXX.jpg";
		return new LayResult(0, "", src);
	}
}
