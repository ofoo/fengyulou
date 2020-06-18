package com.guoguo.test.excel.service;

import com.guoguo.test.excel.entity.Student;
import com.guoguo.test.excel.util.FileUtils;
import com.guoguo.test.excel.dto.ImportExcelParamDto;
import com.guoguo.test.excel.dto.ImportExcelResultDto;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ExcelService {
    /**
     * 导入Excel，保存文件
     *
     * @param dto
     * @return
     */
    public ImportExcelResultDto imp(ImportExcelParamDto dto) {
        ImportExcelResultDto result = new ImportExcelResultDto();
        result.setTitle(dto.getTitle());
        List<Student> studentList = new ArrayList<>();
        result.setStudentList(studentList);
        String fileName = null;
        try {
            fileName = FileUtils.save(dto.getExcel(), FileUtils.SAVE_PATH);
        } catch (Exception e) {
            e.printStackTrace();
            result.setMsg("保存上传文件失败！");
        }

        if (fileName != null) {
            Workbook workbook = null;
            try {
                workbook = WorkbookFactory.create(new File(FileUtils.SAVE_PATH + fileName));
                Sheet sheet = workbook.getSheetAt(0);
                int rowNum = sheet.getLastRowNum();
                for (int i = 1; i <= rowNum; i++) {
                    Row row = sheet.getRow(i);
                    Student student = new Student();
                    studentList.add(student);
                    student.setName(row.getCell(0).getStringCellValue());
                    student.setAge((int) row.getCell(1).getNumericCellValue());
                    student.setTime(row.getCell(2).getDateCellValue());
                }
            } catch (Exception e) {
                e.printStackTrace();
                result.setMsg("解析Excel失败！");
            } finally {
                if (workbook != null) {
                    try {
                        workbook.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return result;
    }

    /**
     * 导入Excel，不保存文件
     *
     * @param dto
     * @return
     */
    public ImportExcelResultDto imp2(ImportExcelParamDto dto) {
        ImportExcelResultDto result = new ImportExcelResultDto();
        result.setTitle(dto.getTitle());
        List<Student> studentList = new ArrayList<>();
        result.setStudentList(studentList);

        Workbook workbook = null;
        try {
            workbook = WorkbookFactory.create(dto.getExcel().getInputStream());
            Sheet sheet = workbook.getSheetAt(0);
            int rowNum = sheet.getLastRowNum();
            for (int i = 1; i <= rowNum; i++) {
                Row row = sheet.getRow(i);
                Student student = new Student();
                studentList.add(student);
                student.setName(row.getCell(0).getStringCellValue());
                student.setAge((int) row.getCell(1).getNumericCellValue());
                student.setTime(row.getCell(2).getDateCellValue());
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.setMsg("解析Excel失败！");
        } finally {
            if (workbook != null) {
                try {
                    workbook.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return result;
    }

    public Workbook export(boolean isXlsx) {
        Workbook workbook;
        if (isXlsx) {
            //07版
            workbook = new XSSFWorkbook();
        } else {
            //03版
            workbook = new HSSFWorkbook();
        }
        Sheet sheet = workbook.createSheet("My Sheet");
        List<List<String>> content = getContent();
        for (int i = 0; i < content.size(); i++) {
            Row row = sheet.createRow(i);
            List<String> rowData = content.get(i);
            for (int j = 0; j < rowData.size(); j++) {
                row.createCell(j).setCellValue(rowData.get(j));
            }
        }
        return workbook;
    }

    private List<List<String>> getContent() {
        List<List<String>> result = new ArrayList<>();
        List<String> row = new ArrayList<>();
        result.add(row);
        row.add("序号");
        row.add("姓名");
        row.add("年龄");
        row.add("时间");

        row = new ArrayList<>();
        result.add(row);
        row.add("1");
        row.add("路人甲");
        row.add("18");
        row.add("2010-01-01");

        row = new ArrayList<>();
        result.add(row);
        row.add("2");
        row.add("路人乙");
        row.add("19");
        row.add("2010-01-02");

        row = new ArrayList<>();
        result.add(row);
        row.add("3");
        row.add("路人丙");
        row.add("20");
        row.add("2010-01-03");
        return result;
    }
}
