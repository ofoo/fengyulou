package com.guoguo.generate.code.controller;

import cn.hutool.core.io.FileUtil;
import com.guoguo.generate.code.entity.Code;
import com.guoguo.generate.code.entity.CodeFile;
import com.guoguo.generate.code.service.CodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/generate")
public class CodeController {
    @Autowired
    private CodeService codeService;

    /**
     * 生成代码页面
     *
     * @param model
     * @return
     */
    @RequestMapping("/code")
    public String index(Model model) {
        codeService.test();
        return "generate/code/generate-code";
    }

    /**
     * 创建代码
     *
     * @param model
     * @param code
     * @return
     */
    @RequestMapping("/create/code")
    public String createCode(Model model, Code code) {
        // 执行操作
        List<CodeFile> codeFileList = codeService.createCode(code);
        // 封装结果
        model.addAttribute("list", codeFileList);
        // 返回页面
        return "code-show";
    }

}
