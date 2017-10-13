/**
 * Copyright @ 2017北京鼎九信息工程研究院有限公司。 All rights reserved.
 *
 * @Author: wangqiang
 * @Date: 2017/10/11 17:35
 */
package com.tanzhouedu.pm.web;

import com.github.pagehelper.PageInfo;
import com.tanzhouedu.pm.common.BaseController;
import com.tanzhouedu.pm.common.PageParam;
import com.tanzhouedu.pm.entity.Dict;
import com.tanzhouedu.pm.service.DictService;
import com.tanzhouedu.pm.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * Copyright @ 2017北京鼎九信息工程研究院有限公司。 All rights reserved.
 * @Title DictController
 * @Project pm
 * @Description 字典信息的控制器
 * @Author wangqiang
 * @date 2017/10/11 17:35
 */
@Controller
@RequestMapping("sys/dict")
public class DictController extends BaseController{
	@Resource
	private DictService dictService;

	/**
	 * 在当前这个Controller 每个方法执行之前执行
	 * @param id
	 * @return
	 */
	@ModelAttribute
	public Dict get(@RequestParam(required = false) String id){
		if (StringUtils.isBlank(id)) {
			return new Dict();
		}else {
			Dict dict = new Dict();
			dict.setId(id);
			return dictService.queryById(dict);
		}
	}

	@RequestMapping(value = {"list",""})
	public String queryList (Dict dict, Model model, PageParam pageParam){
		//获取页面下拉框的类型集合
		List<String> typeList = dictService.queryTypeList(dict);
		model.addAttribute("typeList", typeList);
		PageInfo<Dict> pageInfo = dictService.queryListWithPage(dict, pageParam);
		model.addAttribute("pageInfo", pageInfo);
		return "sys/dictList";
	}

	@RequestMapping("toEdit")
	public String toEdit(Dict dict,Model model){
		model.addAttribute("dict",dict);
		return "sys/dictEdit";
	}

	/**
	 *
	 * @param dict 前台来的绑定好的数据
	 * @param result 校验结果
	 * @param model
	 * @return
	 */
	@RequestMapping ("/save")
	public String save (@Valid Dict dict, BindingResult result, Model model){
		if (result.hasErrors()) {
			return toEdit (dict, model);
		}
		dictService.save(dict);
		return "redirect:/sys/dict/list";
	}
}
