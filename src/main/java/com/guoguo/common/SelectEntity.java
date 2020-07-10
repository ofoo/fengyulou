package com.guoguo.common;

import lombok.Data;

/**
 * xm-select前端插件，下拉选实体类
 */
@Data
public class SelectEntity {
    /**
     * 名称对应的值
     */
    private Long value;
    /**
     * 显示名称
     */
    private String name;
    /**
     * 是否选中 false未选中 true选中
     */
    private boolean selected;
    /**
     * 是否禁用 false未禁用 true禁用
     */
    private boolean disabled;
}
