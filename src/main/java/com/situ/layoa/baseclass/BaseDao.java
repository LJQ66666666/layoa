package com.situ.layoa.baseclass;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.layoa.commons.domain.Pagination;

public interface BaseDao<T> {
	Long save(T t);//保存对象

	Long update(T t);//修改对象

	Long delete(Long rowId);//删除对象

	T get(Long rowId);// 根据ID查询对象

	List<T> find();//查询所有的记录
	
	Integer getCount(@Param("searchParam") T t);//查询出数据的条数
	
	List<T> findByPage(@Param("pagination") Pagination pagination,@Param("searchParam") T t);
}
