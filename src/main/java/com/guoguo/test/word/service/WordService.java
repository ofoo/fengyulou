package com.guoguo.test.word.service;

import com.guoguo.test.word.dto.ImportWordParamDto;
import com.guoguo.test.word.dto.ImportWordResultDto;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.poifs.filesystem.OfficeXmlFileException;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class WordService {
    /**
     * 导入Word
     *
     * @param dto
     * @return
     */
    public ImportWordResultDto imp(ImportWordParamDto dto) {
        ImportWordResultDto result = new ImportWordResultDto();
        result.setTitle(dto.getTitle());
        //03版Word文档解析
        HWPFDocument doc = null;
        try {
            doc = new HWPFDocument(dto.getWord().getInputStream());
            result.setContent(doc.getDocumentText().replace("\r", "<br/>"));
        } catch (OfficeXmlFileException e) {
            System.out.println("这可能是一个07版的Word");
        } catch (Exception e) {
            result.setMsg("这可能不是一个Word");
            return result;
        } finally {
            if (doc != null) {
                try {
                    doc.close();
                    return result;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        //07版Word文档解析
        XWPFDocument docx = null;
        try {
            docx = new XWPFDocument(dto.getWord().getInputStream());
            //获取段落
            List<XWPFParagraph> paragraphList = docx.getParagraphs();
            StringBuilder content = new StringBuilder();
            for (int i = 0; i < paragraphList.size(); i++) {
                if (i != 0) {
                    content.append("<br/>");
                }
                content.append(paragraphList.get(i).getText());
            }
            result.setContent(content.toString());
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (docx != null) {
                try {
                    docx.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return result;
    }

    /**
     * 导出03版Word
     *
     * @param replaceContent
     * @return
     */
    public HWPFDocument export03(Map<String, String> replaceContent) {
        //03版Word文档解析
        HWPFDocument doc = null;
        try {
            doc = new HWPFDocument(new FileInputStream("E:\\upload\\template_03.doc"));
            Range range = doc.getRange();
            for (Map.Entry<String, String> entry : replaceContent.entrySet()) {
                range.replaceText(entry.getKey(), entry.getValue());
            }
        } catch (Exception e) {
            return null;
        }
        return doc;
    }

    /**
     * 导出07版Word
     *
     * @param replaceContent
     * @return
     */
    public XWPFDocument export07(Map<String, String> replaceContent) {
        XWPFDocument docx = null;
        try {
            docx = new XWPFDocument(new FileInputStream("E:\\upload\\template_07.docx"));
            List<XWPFParagraph> paragraphList = docx.getParagraphs();
            for (XWPFParagraph paragraph : paragraphList) {
                List<XWPFRun> runs = paragraph.getRuns();
                for (XWPFRun run : runs) {
                    String str = run.getText(run.getTextPosition());
                    for (Map.Entry<String, String> entry : replaceContent.entrySet()) {
                        str = str.replace(entry.getKey(), entry.getValue());
                    }
                    run.setText(str, 0);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return docx;
    }
}
