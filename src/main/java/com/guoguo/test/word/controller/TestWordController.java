package com.guoguo.test.word.controller;

import com.guoguo.test.excel.dto.ParamDto;
import com.guoguo.test.word.dto.ImportWordParamDto;
import com.guoguo.test.word.dto.ImportWordResultDto;
import com.guoguo.test.word.service.WordService;
import com.guoguo.test.word.util.RequestUtils;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Word相关功能
 */
@Controller
public class TestWordController {
    /**
     * 导入Word页面
     *
     * @return
     */
    @RequestMapping("/import/word")
    public String importWord() {
        return "test/word/import-word";
    }

    /**
     * 导入Word
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/importWord")
    public String importWord(HttpServletRequest request, HttpServletResponse response) {
        if (ServletFileUpload.isMultipartContent(request)) {
            ParamDto dto = RequestUtils.parseParam(request);
            ImportWordParamDto paramDto = new ImportWordParamDto();
            paramDto.setTitle(dto.getParamMap().get("title"));
            paramDto.setWord(dto.getFileMap().get("word"));

            WordService service = new WordService();
            ImportWordResultDto resultDto = service.imp(paramDto);
            request.setAttribute("result", resultDto);
        } else {
            //普通表单，不带文件上传
        }
        return "test/word/import-word-result";
    }

    /**
     * 导出Word页面
     *
     * @return
     */
    @RequestMapping("/export/word")
    public String exportWord() {
        return "test/word/export-word";
    }

    /**
     * 导出Word
     *
     * @param request
     * @param response
     */
    @RequestMapping("/exportWord")
    public void exportWord03(HttpServletRequest request, HttpServletResponse response) {
        WordService service = new WordService();
        Map<String, String> param = new HashMap<>();
        param.put("${name}", request.getParameter("name"));
        param.put("${age}", request.getParameter("age"));
        param.put("${time}", request.getParameter("time"));

        if (request.getParameter("isDocx") != null && !"".equals(request.getParameter("isDocx"))) {
            XWPFDocument docx = service.export07(param);

            response.setHeader("Content-Disposition", "attachment;filename=export.docx");
            try {
                ServletOutputStream outputStream = response.getOutputStream();
                docx.write(outputStream);
                outputStream.flush();
                outputStream.close();
                docx.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            HWPFDocument doc = service.export03(param);

            response.setHeader("Content-Disposition", "attachment;filename=export.doc");
            try {
                ServletOutputStream outputStream = response.getOutputStream();
                doc.write(outputStream);
                outputStream.flush();
                outputStream.close();
                doc.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
