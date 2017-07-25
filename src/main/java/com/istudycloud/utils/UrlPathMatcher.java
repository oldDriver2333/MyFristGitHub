package com.istudycloud.utils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;

/**
 * Springsecurity URL Matcher
 * 
 * @author Cabby
 */
public class UrlPathMatcher{
    private static final Log logger = LogFactory.getLog(UrlPathMatcher.class);

    private boolean requiresLowerCaseUrl = true;
    private PathMatcher pathMatcher = new AntPathMatcher();

    public UrlPathMatcher() {
        this(true);
    }

    public UrlPathMatcher(boolean requiresLowerCaseUrl) {
        this.requiresLowerCaseUrl = requiresLowerCaseUrl;
    }

    public Object compile(String path) {
        if (requiresLowerCaseUrl) {
            return path.toLowerCase();
        }

        return path;
    }

    public void setRequiresLowerCaseUrl(boolean requiresLowerCaseUrl) {
        this.requiresLowerCaseUrl = requiresLowerCaseUrl;
    }

    public boolean pathMatchesUrl(Object path, String url) {
        return pathMatcher.match((String)path, url);
    }

    public String getUniversalMatchPattern() {
        return "/**";
    }

    public boolean requiresLowerCaseUrl() {
        return requiresLowerCaseUrl;
    }
    
    public static void main(String[] args) {
    	UrlPathMatcher m=new UrlPathMatcher();
    	System.out.println(m.pathMatchesUrl("/user/**","/user/asd/sd"));
	}
}
