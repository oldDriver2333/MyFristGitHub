package com.istudycloud.utils;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
/**
 * @author Cabby
 */
public abstract class PasswordUtil {

    private PasswordUtil() {}

    /**
     * MD5加密
     * @param originalPassword 原密码
     * 123{admin}   ->
     * @return 加密后密码
     */
    public static String encryptPassword(String originalPassword,String username) {
        Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
        StringBuilder s=new StringBuilder(originalPassword).append("{").append(username).append("}");
        return md5PasswordEncoder.encodePassword(s.toString(), null);
    }
    
}
