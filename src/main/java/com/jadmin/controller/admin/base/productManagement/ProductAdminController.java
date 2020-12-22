package com.jadmin.controller.admin.base.productManagement;

import com.jadmin.modules.annotation.AdminPage;
import com.jadmin.modules.annotation.column.FormColunm;
import com.jadmin.modules.annotation.column.TableColumn;
import com.jadmin.modules.annotation.list.*;
import com.jadmin.modules.controller.base.CommonListController;
import com.jadmin.vo.entity.base.CategoryAdminVO;
import com.jadmin.vo.entity.base.ProductAdminVO;
import com.jadmin.vo.enumtype.AdminPageMenu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.persistence.Column;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.List;

/**
 * @Description: 产品管理
 * @Author: dongzhou
 * @CreateDate: 2020/12/21 10:59
 */
@Controller
@RequestMapping("/product") // 定义前台url访问的基础路径
@TableHql(value = "isDelete = 0",orderBy = "operateTime desc")
@SearchMode()
@DeleteMode(DeleteMode.DELETE) // 定义删除策略为真删
@AdminPage(menu = AdminPageMenu.categoryCenter, name = "产品管理") // 声明后台管理页面左边的菜单属性，用来控制权限
@FileConfig(selfJsp = {"edit"}) // 只通用 admin/common/date-list.jsp，edit跳到自己默认的jsp页面
@AdminPageNoButton({"toShow"}) // 声明页面中不需要的button，默认显示删除、添加、编辑 3个按钮
public class ProductAdminController  extends CommonListController<ProductAdminVO> {
    @FormColunm(value = "编号")
    @TableColumn
    private String seq;


    @FormColunm(value = "类别名称")
    private String productName;

    @TableColumn(selectCode = "userRole")
    @FormColunm(value = "系列名称")
    private String seriesName;

    @TableColumn
    @FormColunm(value = "规格名称")
    private String specifName;

    @TableColumn
    @FormColunm(value = "单价(元)")
    private BigDecimal price;
    @TableColumn

    @FormColunm(value = "积分")
    private String integral;


    @TableColumn
    @FormColunm(value = "操作时间",editShow=false)
    private String operateTime;

    @TableColumn
    @FormColunm(value = "操作人",editShow=false)
    private String operatorId;

    @FormColunm(value = "是否可用",selectCode = "billStatus")
    private String billStatus;

    @TableColumn
    @FormColunm(value = "描述", type = "textarea", length = 200, required = false)
    private String memo;

    @Override
    public void beforeEditSave(ProductAdminVO vo, HttpServletRequest request) {
        String userId = getClientENV(request.getSession()).getCurUser().getName();
        vo.setIsDelete("0");
        vo.setOperatorId(userId);
        vo.setOperateTime(getTs());
    }

    @Override
    public boolean beforeDelete(List<String> ids, HttpServletRequest request) {
        return true;
    }
}
