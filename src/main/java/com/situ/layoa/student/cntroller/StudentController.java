package com.situ.layoa.student.cntroller;

import java.io.Serializable;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.situ.layoa.student.domian.Student;

@RestController
@RequestMapping("/student")
public class StudentController implements Serializable {
	private static final long serialVersionUID = 1L;

	@PostMapping
	public Long doAddStudent(Student student) {
		System.out.println(student);
		return 1L;
	}

	@GetMapping("/checkstuname")
	public Integer checkStuName(String stuName) {
		Integer result = 1;
		if ("zhangsan".equals(stuName)) {
			result = 0;
		}
		return result;
	}

}
