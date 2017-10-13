package com.tanzhouedu.pm.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 登陆控制器
 *
 */
@Controller
public class LoginController {

    @RequestMapping (value = "/login")
    public String login () {
        return "sys/login";
    }
}
