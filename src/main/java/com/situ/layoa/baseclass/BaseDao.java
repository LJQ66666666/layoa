package com.situ.layoa.baseclass;

import java.util.List;

public interface BaseDao<T> {
	Long save(T t);//保存对象

	Long update(T t);//修改对象

	Long delete(Long rowId);//删除对象

	T get(Long rowId);// 根据ID查询对象

	List<T> find();//查询所有的记录
}
