package com.guoguo.test.word.util;

import com.guoguo.test.excel.dto.ParamDto;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

public class RequestUtils {
    /**
     * 从request流中解析参数与上传文件
     *
     * @param request
     */
    public static ParamDto parseParam(HttpServletRequest request) {
        ParamDto result = new ParamDto();
        ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
        upload.setHeaderEncoding("UTF-8");
        try {
            List<FileItem> fileItemList = upload.parseRequest(request);
            for (FileItem fileItem : fileItemList) {
                if (fileItem.isFormField()) {
                    result.getParamMap().put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
                } else {
                    result.getFileMap().put(fileItem.getFieldName(), fileItem);
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
