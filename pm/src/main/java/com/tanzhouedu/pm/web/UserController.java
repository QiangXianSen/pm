package com.tanzhouedu.pm.web;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户信息的控制类
 */
@Controller
@RequestMapping ("/sys/user")
public class UserController {

    @RequestMapping ("/queryList")
    public String queryList () {
        return "sys/userList";
    }
}
