package com.tanzhouedu.pm.dao.mapper;

import com.tanzhouedu.pm.common.BaseMapper;
import com.tanzhouedu.pm.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户信息数据持久化操作接口
 */
@Repository
public interface UserMapper extends BaseMapper<User> {


    /**
     * 根据条件查询用户数据
     * @param user
     * @return
     */
    List <User> queryAllUser (User user);
}
