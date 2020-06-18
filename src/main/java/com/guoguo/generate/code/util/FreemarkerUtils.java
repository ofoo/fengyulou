package com.guoguo.generate.code.util;

import com.guoguo.generate.code.config.CodeConfig;
import com.guoguo.util.PropertiesUtil;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.FileWriter;
import java.io.StringWriter;
import java.util.Map;

public class FreemarkerUtils {
    private static final Logger looger = LoggerFactory.getLogger(FreemarkerUtils.class);
    private static Configuration cfg;
    public static String filePath;

    static {
        cfg = new Configuration(Configuration.VERSION_2_3_22);
        cfg.setClassForTemplateLoading(FreemarkerUtils.class, PropertiesUtil.getProperty("fengyulou.generate.code.templates.path"));
        cfg.setDefaultEncoding("UTF-8");
    }

    public final static String ENTITY = "Entity.ftl";
    public final static String ENTITY_DAO = "EntityDao.ftl";
    public final static String ENTITY_SERVICE = "EntityService.ftl";
    public final static String ENTITY_CONTROLLER = "EntityController.ftl";
    public final static String ENTITY_CONSTANT = "EntityConstant.ftl";
    public final static String ENTITY_MAPPER = "EntityMapper.ftl";
    public final static String PAGE_LIST = "PageList.ftl";
    public final static String PAGE_SAVE = "PageSave.ftl";

    private static void create(Map root, String templateName) {
        StringWriter stringWriter = new StringWriter();
        FileWriter fileWriter = null;
        try {
            Template temp = cfg.getTemplate(templateName);
            // 获得代码内容在页面显示
            temp.process(root, stringWriter);
            // 在指定路径生成文件
            fileWriter = new FileWriter(filePath);
            temp.process(root, fileWriter);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                stringWriter.close();
            } catch (Exception e) {
                looger.error("关闭stringWriter流失败");
            }
            try {
                if (fileWriter != null) {
                    fileWriter.close();
                }
            } catch (Exception e) {
                looger.error("关闭fileWriter流失败");
            }
        }
    }

    public static void createEntity(Map root) {
        create(root, ENTITY);
    }

    public static void createEntityDao(Map root) {
        create(root, ENTITY_DAO);
    }

    public static void createEntityController(Map root) {
        create(root, ENTITY_CONTROLLER);
    }

    public static void createEntityService(Map root) {
        create(root, ENTITY_SERVICE);
    }

    public static void createEntityConstant(Map root) {
        create(root, ENTITY_CONSTANT);
    }

    public static void createEntityMapper(Map root) {
        create(root, ENTITY_MAPPER);
    }

    public static void createPageList(Map root) {
        create(root, PAGE_LIST);
    }

    public static void createPageSave(Map root) {
        create(root, PAGE_SAVE);
    }

    public static void main(String[] args) {
        System.out.println(FreemarkerUtils.class.getClassLoader().getResource("static/template"));
    }
}
