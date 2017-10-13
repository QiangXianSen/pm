/**
 * Copyright @ 2017北京鼎九信息工程研究院有限公司。 All rights reserved.
 *
 * @Author: wangqiang
 * @Date: 2017/10/10 21:07
 */
package com.tanzhouedu.pm.common;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tanzhouedu.pm.entity.Dict;
import com.tanzhouedu.pm.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Copyright @ 2017北京鼎九信息工程研究院有限公司。 All rights reserved.
 * @Title BaseService
 * @Project pm
 * @Description TODO
 * @Author wangqiang
 * @date 2017/10/10 21:07
 */
public class BaseService <D extends BaseMapper<T>,T extends BaseEntity> {
	@Autowired
	protected D mapper;

	/**
	 * 根据ID查询一条数据
	 * @param dict
	 * @return
	 */
	public T queryById(Dict dict){
		return mapper.queryById(dict);
	}

	/**
	 * 查询列表
	 * @param entity
	 * @return
	 */
	public List<T> queryList(T entity){
		return mapper.queryList(entity);
	}

	/**
	 * 分页查询列表 pageHelper PageInfo 分页参数，起始页码 每一页大小， 排序
	 * @param entity
	 * @param pageParam
	 * @return
	 */
	public PageInfo<T> queryListWithPage(T entity,PageParam pageParam){
		//判断是否含有排序的字符串
		if (StringUtils.isNotBlank(pageParam.getOderBy())) {
			PageHelper.orderBy(pageParam.getOderBy());
		}
		PageHelper.startPage(pageParam.getPageNum(), pageParam.getPageSize());
		List<T> resultList = mapper.queryList(entity);
		return new PageInfo<T>(resultList,8);
	}

	/**
	 * 保存数据 id为空时，执行新增，否则实行更新
	 * @param entity
	 * @return
	 */
	public boolean save(T entity){
		int res = 0;
		if (StringUtils.isNotBlank(entity.getId())) {
			entity.preUpadate();
			res = mapper.update(entity);
		}else{
			entity.preInsert();
			res = mapper.insert(entity);
		}
		return res > 0;
	}

	/**
	 * 删除数据
	 * @param entity
	 * @return
	 */
	public boolean delete(T entity){
		int res = mapper.delete(entity);
		return res > 0;
	}
}
