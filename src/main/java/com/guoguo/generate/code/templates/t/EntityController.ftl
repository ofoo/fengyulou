package ${packName}.controller.${entity?lower_case};

import com.guoguo.common.CurrentUserManager;
import com.guoguo.common.ServerResponse;
import com.guoguo.fengyulou.entity.${entity?lower_case}.${entity?cap_first};
import com.guoguo.fengyulou.service.${entity?lower_case}.${entity?cap_first}Service;
import com.guoguo.util.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * ${explain}
 */
@Controller
@RequestMapping("/fyl")
public class ${entity?cap_first}Controller {

    @Autowired
    private ${entity?cap_first}Service ${entity?lower_case}Service;
    @Autowired
    private CurrentUserManager currentUserManager;

    /**
     * 列表页面
     *
     * @return
     */
    @RequestMapping("/${entity?lower_case}/list/page")
    public String list(HttpServletRequest request, HttpSession session, ${entity?cap_first} ${entity?lower_case}) {
        ${entity?lower_case}.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", ${entity?lower_case}Service.get${entity?cap_first}ListPage(${entity?lower_case}));
        request.setAttribute("data", ${entity?lower_case});
        return "${entity?lower_case}/${entity?lower_case}-list";
    }

    @RequestMapping("/${entity?lower_case}/ajax/list")
    public String ajaxList(HttpServletRequest request, HttpSession session, ${entity?cap_first} ${entity?lower_case}) {
        ${entity?lower_case}.setUserId(currentUserManager.getUserId());
        request.setAttribute("pageInfo", ${entity?lower_case}Service.get${entity?cap_first}ListPage(${entity?lower_case}));
        request.setAttribute("data", ${entity?lower_case});
        return "${entity?lower_case}/${entity?lower_case}-list-ajax";
    }

    /**
     * 添加页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/${entity?lower_case}/insert")
    public String insert(HttpServletRequest request, HttpSession session) {
        request.setAttribute("pageTitle", "添加${explain}");
        return "${entity?lower_case}/${entity?lower_case}-save";
    }

    /**
     * 修改页面
     *
     * @param request
     * @param session
     * @param ${entity?lower_case}
     * @return
     */
    @RequestMapping("/${entity?lower_case}/update")
    public String update(HttpServletRequest request, HttpSession session, ${entity?cap_first} ${entity?lower_case}) {
        request.setAttribute("pageTitle", "修改${explain}");
        // 查询${explain}
        ${entity?lower_case}.setUserId(currentUserManager.getUserId());
        request.setAttribute("data", ${entity?lower_case}Service.get${entity?cap_first}ByIdAndUserId(${entity?lower_case}));
        return "${entity?lower_case}/${entity?lower_case}-save";
    }

    /**
     * 保存数据
     *
     * @param ${entity?lower_case}
     * @return
     */
    @RequestMapping("/${entity?lower_case}/ajax/save")
    @ResponseBody
    public ServerResponse ajaxSave(${entity?cap_first} ${entity?lower_case}, HttpSession session) {
        if (StringUtils.isBlank(${entity?lower_case}.getName())) {
            return ServerResponse.createByErrorMessage("请输入${explain}名称");
        }
        ${entity?lower_case}.setUserId(currentUserManager.getUserId());
        return ${entity?lower_case}Service.save${entity?cap_first}(${entity?lower_case});
    }

    /**
     * 删除数据
     *
     * @param ids
     * @return
     */
    @RequestMapping("/${entity?lower_case}/ajax/delete")
    @ResponseBody
    public ServerResponse ajaxDelete(@RequestParam List<Long> ids, HttpSession session) {
        if (ObjectUtils.isNull(ids)) {
            return ServerResponse.createByErrorMessage("请选择数据");
        }
        return ${entity?lower_case}Service.delete${entity?cap_first}ByIdsAndUserId(ids, currentUserManager.getUserId());
    }

    /**
     * 下拉选列表
     *
     * @param request
     * @return
     */
    @RequestMapping("/${entity?lower_case}/ajax/content")
    public String ajaxList(HttpServletRequest request, HttpSession session) {
        ${entity?cap_first} ${entity?lower_case} = new ${entity?cap_first}();
        ${entity?lower_case}.setUserId(currentUserManager.getUserId());
        request.setAttribute("list", ${entity?lower_case}Service.get${entity?cap_first}List(${entity?lower_case}));
        return "common/select-item";
    }
}
