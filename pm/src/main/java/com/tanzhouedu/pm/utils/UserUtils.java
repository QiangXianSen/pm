package com.tanzhouedu.pm.utils;

import com.tanzhouedu.pm.entity.User;

/**
 * 用户信息帮助类
 */
public class UserUtils {

    /**
     * 获取当前登陆的用户
     * @return
     */
    public static User getCurrentUser () {
        return new User("1");
    }
}
