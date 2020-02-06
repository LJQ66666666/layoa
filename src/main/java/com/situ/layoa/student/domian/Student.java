package com.situ.layoa.student.domian;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;
@Alias("Student")
public class Student implements Serializable {
	private static final long serialVersionUID = 1L;
	private Long rowId;//主键
	private String stuName;//学生名称
	private Integer stuAge;//学生年龄
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date stuBirthday;//学生生日
	private Integer stuSex;//学生性别
	private List<String>stuLike;//学生爱好
	
	
	public Long getRowId() {
		return rowId;
	}
	public void setRowId(Long rowId) {
		this.rowId = rowId;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public Integer getStuAge() {
		return stuAge;
	}
	public void setStuAge(Integer stuAge) {
		this.stuAge = stuAge;
	}
	public Date getStuBirthday() {
		return stuBirthday;
	}
	public void setStuBirthday(Date stuBirthday) {
		this.stuBirthday = stuBirthday;
	}
	public Integer getStuSex() {
		return stuSex;
	}
	public void setStuSex(Integer stuSex) {
		this.stuSex = stuSex;
	}
	
	public List<String> getStuLike() {
		return stuLike;
	}
	public void setStuLike(List<String> stuLike) {
		this.stuLike = stuLike;
	}
	@Override
	public String toString() {
		return "Student [rowId=" + rowId + ", stuName=" + stuName + ", stuAge=" + stuAge + ", stuBirthday="
				+ stuBirthday + ", stuSex=" + stuSex + ", stuLike=" + stuLike + "]";
	}
	
	
	
}
