package com.jadmin.controller.admin.base.productManagement;

import com.jadmin.modules.annotation.AdminPage;
import com.jadmin.modules.annotation.column.FormColunm;
import com.jadmin.modules.annotation.list.AdminPageNoButton;
import com.jadmin.modules.annotation.list.FileConfig;
import com.jadmin.modules.annotation.list.TableHql;
import com.jadmin.modules.controller.base.CommonListController;
import com.jadmin.vo.entity.base.CategoryAdminVO;
import com.jadmin.vo.entity.base.OrgVO;
import com.jadmin.vo.enumtype.AdminPageMenu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.persistence.Column;

/**
 * @Description: （1）类别管理
 * @Author: dongzhou
 * @CreateDate: 2020/12/20 12:40
 */
@Controller
@RequestMapping("/category") // 定义前台url访问的基础路径
@TableHql(orderBy = "operateTime desc")
@AdminPage(menu = AdminPageMenu.categoryCenter, name = "类别管理") // 声明后台管理页面左边的菜单属性，用来控制权限
@FileConfig(selfJsp = {"edit"}) // 只通用 admin/common/date-list.jsp，edit跳到自己默认的jsp页面
@AdminPageNoButton({"toShow"}) // 声明页面中不需要的button，默认显示删除、添加、编辑 3个按钮
public class CategoryAdminContraroller extends CommonListController<CategoryAdminVO> {

    @FormColunm(value = "编号")
    private String seq;

    @FormColunm(value = "名称")
    private String categoryName;

    @FormColunm(value = "正常")
    private String state;
//
//    private String isDelete;
//
//    private String operateTime;
    @FormColunm(value = "操作员")
    private String operatorId;
}
