/**
 * Copyright @ 2017北京鼎九信息工程研究院有限公司。 All rights reserved.
 *
 * @Author: wangqiang
 * @Date: 2017/10/11 17:37
 */
package com.tanzhouedu.pm.service;

import com.tanzhouedu.pm.common.BaseService;
import com.tanzhouedu.pm.dao.mapper.DictMapper;
import com.tanzhouedu.pm.entity.Dict;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Copyright @ 2017北京鼎九信息工程研究院有限公司。 All rights reserved.
 * @Title DictService
 * @Project pm
 * @Description 字典信息的服务类
 * @Author wangqiang
 * @date 2017/10/11 17:37
 */
@Service
public class DictService extends BaseService<DictMapper,Dict> {
	/**
	 * 查询所有字典类型
	 * @param dict
	 * @return
	 */
	public List<String> queryTypeList (Dict dict){
		return mapper.queryTypeList(dict);
	}
}
