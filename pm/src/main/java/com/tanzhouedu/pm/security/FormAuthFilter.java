package com.tanzhouedu.pm.security;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Component;

/**
 * 表单验证的过滤器
 */
@Component
public class FormAuthFilter extends FormAuthenticationFilter{
}
