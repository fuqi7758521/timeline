package com.hofuqi.timeline.common;

/**
 * @author fuqi
 * @date 2014-10-13
 */
public interface Constants {

    String PASSWORD_SALT_KEY="Salt.hofuqi.com.timeline.2014"; // md5(用户密码+PASSWORD_SALT_KEY)保存到数据库中。
    
    Integer STATUS_NORMAL = 1;
    
    Integer STATUS_INVALID = 0;

}
