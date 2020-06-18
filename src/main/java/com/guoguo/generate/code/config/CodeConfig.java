package com.guoguo.generate.code.config;

import com.guoguo.util.PropertiesUtil;

public class CodeConfig {
    /**
     * 存放代码路径
     */
    public static final String CODE_PATH = PropertiesUtil.getProperty("fengyulou.generate.code.path");
    /**
     * 代码模板路径
     */
    public static final String CODE_TEMPLATE_PATH = PropertiesUtil.getProperty("fengyulou.generate.code.templates.path");
    /**
     * 代码包路径
     */
    public static final String CODE_PACKAGE_PATH = PropertiesUtil.getProperty("fengyulou.generate.code.package.path");
    /**
     * 表前缀
     */
    public static final String CODE_TABLE_PREFIX = PropertiesUtil.getProperty("fengyulou.generate.code.table.prefix");
}
