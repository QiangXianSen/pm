package com.tanzhouedu.pm.common;

import com.tanzhouedu.pm.entity.Dict;

import java.util.List;

/**
 * 所有数据库持久化操作超类
 */
public interface BaseMapper<T> {

    /**
     * 查询列表
     * @param entity
     * @return
     */
    List<T> queryList (T entity);

    /**
     * 根据ID查询数据
     * @param dict 实体类id
     * @return
     */
    T queryById (Dict dict);


    /**
     * 执行插入操作
     * @param entity
     * @return
     */
    int insert (T entity);

    /**
     * 执行更新操作
     * @param entity
     * @return
     */
    int update (T entity);

    /**
     * 执行删除操作
     * @param entity
     * @return
     */
    int delete (T entity);
}
