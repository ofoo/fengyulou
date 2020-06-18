package com.guoguo.test.excel.controller;

import com.guoguo.test.excel.dto.ImportExcelParamDto;
import com.guoguo.test.excel.dto.ImportExcelResultDto;
import com.guoguo.test.excel.dto.ParamDto;
import com.guoguo.test.excel.service.ExcelService;
import com.guoguo.test.excel.util.FileUtils;
import com.guoguo.test.excel.util.RequestUtils;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Excel相关功能
 */
@Controller
public class TestExcelController {
    /**
     * 导入Excel页面
     *
     * @return
     */
    @RequestMapping("/import/excel")
    public String importFile() {
        return "test/excel/import-excel";
    }

    /**
     * 导入Excel，保存文件
     *
     * @param request
     */
    @RequestMapping("/importExcel")
    public String importExcel(HttpServletRequest request) {
        if (ServletFileUpload.isMultipartContent(request)) {
            //解析表单数据
            ParamDto dto = RequestUtils.parseParam(request);
            ImportExcelParamDto paramDto = new ImportExcelParamDto();
            paramDto.setTitle(dto.getParamMap().get("title"));
            paramDto.setExcel(dto.getFileMap().get("excel"));

            //导入Excel
            ExcelService service = new ExcelService();
            ImportExcelResultDto resultDto = service.imp(paramDto);
            request.setAttribute("result", resultDto);
        } else {
            //普通表单，不带文件上传
        }
        return "test/import-excel-result";
    }

    /**
     * 导入Excel，不保存文件
     *
     * @param request
     */
    @RequestMapping("/importExcel2")
    public String importExcel2(HttpServletRequest request) {
        if (ServletFileUpload.isMultipartContent(request)) {
            //解析表单数据
            ParamDto dto = RequestUtils.parseParam(request);
            ImportExcelParamDto paramDto = new ImportExcelParamDto();
            paramDto.setTitle(dto.getParamMap().get("title"));
            paramDto.setExcel(dto.getFileMap().get("excel"));

            //导入Excel
            ExcelService service = new ExcelService();
            ImportExcelResultDto resultDto = service.imp2(paramDto);
            request.setAttribute("result", resultDto);
        } else {

        }
        return "test/import-excel-result";
    }

    /**
     * 导出Excel页面
     *
     * @return
     */
    @RequestMapping("/export/excel")
    public String exportFile() {
        return "test/excel/export-excel";
    }

    /**
     * 导出Excel，不保存文件
     *
     * @param request
     */
    @RequestMapping("/exportExcel")
    public void exportExcel(HttpServletRequest request, HttpServletResponse response) {
        ExcelService service = new ExcelService();
        Workbook workbook = service.export(true);
        response.setHeader("Content-Disposition", "attachment;filename=export.xlsx");
        try {
            ServletOutputStream outputStream = response.getOutputStream();
            workbook.write(outputStream);
            outputStream.flush();
            outputStream.close();
            workbook.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 导出Excel，先保存文件再下载
     *
     * @param request
     */
    @RequestMapping("/exportExcel2")
    public void exportExcel2(HttpServletRequest request, HttpServletResponse response) {
        ExcelService service = new ExcelService();
        Workbook workbook = service.export(true);
        response.setHeader("Content-Disposition", "attachment;filename=export.xlsx");
        try {
            ServletOutputStream outputStream = response.getOutputStream();
            FileOutputStream fileOutputStream = new FileOutputStream(FileUtils.SAVE_PATH + "export.xlsx");
            workbook.write(fileOutputStream);

            //保存文件
            FileInputStream fileInputStream = new FileInputStream(FileUtils.SAVE_PATH + "export.xlsx");
            byte[] bytes = new byte[fileInputStream.available()];
            fileInputStream.read(bytes);

            //导出文件
            outputStream.write(bytes);
            outputStream.flush();
            outputStream.close();
            workbook.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
