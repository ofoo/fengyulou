package com.guoguo.generate.code.service;

import com.guoguo.generate.code.config.CodeConfig;
import com.guoguo.generate.code.entity.Attr;
import com.guoguo.generate.code.entity.Code;
import com.guoguo.generate.code.entity.CodeFile;
import com.guoguo.generate.code.util.FreemarkerUtils;
import com.guoguo.generate.code.util.StringUtils;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CodeService {

    /**
     * 创建代码
     *
     * @param code
     */
    public void createCode(Code code) {
        /* 属性集合 */
        List<Attr> attrList = new ArrayList<>();
        // 属性类型集合
        List<String> attrTypeList = new ArrayList<>();
        // 表字段集合
        List<String> fieldList = new ArrayList<>();
        // 表修改SQL字段集合
        List<String> updateFieldList = new ArrayList<>();
        // 表分页查询SQL条件集合
        List<String> selectFieldList = new ArrayList<>();
        //唯一
        String soleWhere = "";

        for (String s : code.getAttr()) {
            String[] array = StringUtils.strTurnStringArray(s, StringUtils.SYMBOL);

            // 获取类属性值
            Attr attr = new Attr();
            attr.setType(array[0]);
            attr.setName(array[1]);
            attr.setDesc(array[2]);
            attrList.add(attr);

            //验证唯一
            String sole = array[3];
            if (StringUtils.isBlank(sole) && sole.equals("true")) {
                soleWhere = "`" + StringUtils.toUnderlineCase(array[1]) + "`" + "=" + "#{" + array[1] + "}";
            }

            // 获取属性类型值
            String attrType = getAttrType(array[0]);
            if (attrType != null) {
                attrTypeList.add(attrType);
            }

            // 获取表字段值
            fieldList.add(StringUtils.toUnderlineCase(array[1]));

            updateFieldList.add("`" + StringUtils.toUnderlineCase(array[1]) + "`" + "=" + "#{" + array[1] + "}");

            StringBuffer where = new StringBuffer();
            // 获取表修改SQL字段
            if (array[0].equals("String")) {
                where.append("<if test=\"" + array[1] + "!=null and " + array[1] + "!=''\">");
                where.append("and `" + StringUtils.toUnderlineCase(array[1]) + "` like CONCAT('%',#{" + array[1] + "},'%')");
                where.append("</if>");
            } else {
                where.append("<if test=\"" + array[1] + "!=null\">");
                where.append("and `" + StringUtils.toUnderlineCase(array[1]) + "`=#{" + array[1] + "}");
                where.append("</if>");
            }
            selectFieldList.add(where.toString());
        }

        // 组装类名称
        String entity = StringUtils.capFirst(code.getEntity());
        String entityDao = entity + CodeFile.DAO;
        String entityService = entity + CodeFile.SERVICE;
        String entityController = entity + CodeFile.CONTROLLER;
        String entityConstant = entity + CodeFile.CONSTANT;
        String entityMapper = entity + CodeFile.MAPPER;
        String entityList = CodeFile.LIST;
        String entitySave = CodeFile.SAVE;

        // 封装模板使用到的值
        Map root = new HashMap();
        root.put("packName", CodeConfig.CODE_PACKAGE_PATH);
        root.put("explain", code.getExplain());
        root.put("entity", code.getEntity());
        root.put("attrList", attrList);
        root.put("attrTypeList", attrTypeList);
        root.put("table", CodeConfig.CODE_TABLE_PREFIX + entity.toLowerCase());
        root.put("fieldList", fieldList);
        root.put("updateFieldList", updateFieldList);
        root.put("selectFieldList", selectFieldList);
        root.put("requestRootUrl", code.getRequestRootUrl());
        //数据表前缀
        root.put("tablePrefix", CodeConfig.CODE_TABLE_PREFIX);
        //唯一条件
        root.put("soleWhere", soleWhere);


        // 生成entity代码
        File file = new File(code.getCodeFilePath() + File.separator + "entity" + File.separator + entity.toLowerCase());
        if (!file.exists()) {
            file.mkdirs();
        }
        FreemarkerUtils.filePath = file.getPath() + File.separator + entity + ".java";
        FreemarkerUtils.createEntity(root);

        // 生成constant代码
        file = new File(code.getCodeFilePath() + File.separator + "constant" + File.separator + entity.toLowerCase());
        if (!file.exists()) {
            file.mkdirs();
        }
        FreemarkerUtils.filePath = file.getPath() + File.separator + entityConstant + ".java";
        FreemarkerUtils.createEntityConstant(root);

        // 生成dao代码
        file = new File(code.getCodeFilePath() + File.separator + "dao" + File.separator + entity.toLowerCase());
        if (!file.exists()) {
            file.mkdirs();
        }
        FreemarkerUtils.filePath = file.getPath() + File.separator + entityDao + ".java";
        FreemarkerUtils.createEntityDao(root);

        // 生成service代码
        file = new File(code.getCodeFilePath() + File.separator + "service" + File.separator + entity.toLowerCase());
        if (!file.exists()) {
            file.mkdirs();
        }
        FreemarkerUtils.filePath = file.getPath() + File.separator + entityService + ".java";
        FreemarkerUtils.createEntityService(root);

        // 生成controller代码
        file = new File(code.getCodeFilePath() + File.separator + "controller" + File.separator + entity.toLowerCase());
        if (!file.exists()) {
            file.mkdirs();
        }
        FreemarkerUtils.filePath = file.getPath() + File.separator + entityController + ".java";
        FreemarkerUtils.createEntityController(root);

        // 生成mapper代码
        file = new File(code.getMapperFilePath() + File.separator + entity.toLowerCase());
        if (!file.exists()) {
            file.mkdirs();
        }
        FreemarkerUtils.filePath = file.getPath() + File.separator + entityMapper + ".xml";
        FreemarkerUtils.createEntityMapper(root);

        // 生成list.html代码
        file = new File(code.getPageFilePath() + File.separator + entity.toLowerCase());
        if (!file.exists()) {
            file.mkdirs();
        }
        FreemarkerUtils.filePath = file.getPath() + File.separator + entityList + ".html";
        FreemarkerUtils.createPageList(root);

        // 生成save.html代码
        file = new File(code.getPageFilePath() + File.separator + entity.toLowerCase());
        if (!file.exists()) {
            file.mkdirs();
        }
        FreemarkerUtils.filePath = file.getPath() + File.separator + entitySave + ".html";
        FreemarkerUtils.createPageSave(root);
    }

    /**
     * 获取属性类型
     *
     * @param s
     */
    private String getAttrType(String s) {
        String type = null;
        switch (s) {
            case "Date":
                type = "import java.util.Date;";
                break;
            case "BigDecimal":
                type = "import java.math.BigDecimal;";
                break;
        }
        return type;
    }
}
