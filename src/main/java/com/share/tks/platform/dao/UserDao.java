package com.share.tks.platform.dao;

import com.share.tks.platform.entity.User;

public interface UserDao {
        /**
     * 功能描述：根据账号来获取用户信息
     * @param username
     * @return
     */

    User findByUserName(String username);

}
