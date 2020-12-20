package com.jadmin.controller.admin.base.productManagement;

import com.jadmin.modules.annotation.AdminPage;
import com.jadmin.modules.annotation.column.FormColunm;
import com.jadmin.modules.annotation.column.InitDefaultColunm;
import com.jadmin.modules.annotation.column.TableColumn;
import com.jadmin.modules.annotation.list.*;
import com.jadmin.modules.controller.base.CommonListController;
import com.jadmin.vo.entity.base.CategoryAdminVO;
import com.jadmin.vo.enumtype.AdminPageMenu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Description: java类作用描述
 * @Author: dongzhou
 * @CreateDate: 2020/12/20 17:00
 */
@Controller
@RequestMapping("/specif") // 定义前台url访问的基础路径
@TableHql(value = "isDelete = 0", orderBy = "operateTime desc")
@SearchMode()
@DeleteMode(DeleteMode.DELETE) // 定义删除策略为真删
@AdminPage(menu = AdminPageMenu.categoryCenter, name = "规格管理") // 声明后台管理页面左边的菜单属性，用来控制权限
@FileConfig(selfJsp = {"edit"}) // 只通用 admin/common/date-list.jsp，edit跳到自己默认的jsp页面
@AdminPageNoButton({"toShow"}) // 声明页面中不需要的button，默认显示删除、添加、编辑 3个按钮
public class SpecificationsAdminContraroller extends CommonListController<CategoryAdminVO> {

    @FormColunm(value = "编号")
    @TableColumn
    private String seq;

    @FormColunm(value = "规格", selectStyle = "tree")
    @TableColumn(search = true)
    private String categoryName;


    @TableColumn(value = "操作人")
    @InitDefaultColunm
    public String operatorId;

    @FormColunm(value = "状态", selectCode = "billStatus")
    @TableColumn(search = true)
    private String billStatus;

    @FormColunm(value = "描述")
    @TableColumn(search = true)
    private String memo;

    @Override
    public boolean beforeDelete(List<String> ids, HttpServletRequest request) {
        return true;
    }

    @Override
    public void beforeEditSave(CategoryAdminVO vo, HttpServletRequest request) {
        String userId = getClientENV(request.getSession()).getCurUser().getName();
        vo.setIsDelete("0");
        vo.setOperatorId(userId);
        vo.setType("SPECIF");
        vo.setOperateTime(getTs());
    }

    @Override
    public String getHqlWhere(HttpServletRequest request) {
        return "type = 'SPECIF'";

    }
}
