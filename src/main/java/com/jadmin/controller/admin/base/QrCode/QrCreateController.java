package com.jadmin.controller.admin.base.QrCode;

import com.jadmin.modules.annotation.AdminPage;
import com.jadmin.modules.annotation.list.*;
import com.jadmin.modules.controller.base.CommonListController;
import com.jadmin.vo.entity.base.CategoryAdminVO;
import com.jadmin.vo.enumtype.AdminPageMenu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description: java类作用描述
 * @Author: dongzhou
 * @CreateDate: 2020/12/23 9:42
 */
@Controller
@RequestMapping("/qrCode") // 定义前台url访问的基础路径
@TableHql(value = "isDelete = 0", orderBy = "operateTime desc")
@SearchMode()
@DeleteMode(DeleteMode.DELETE) // 定义删除策略为真删
@AdminPage(menu = AdminPageMenu.qrCode, name = "二维码生成",openUrl = "admin/business/qrCode/data-list") // 声明后台管理页面左边的菜单属性，用来控制权限
@FileConfig(selfJsp = {"edit"}) // 只通用 admin/common/date-list.jsp，edit跳到自己默认的jsp页面
@AdminPageNoButton({""}) // 声明页面中不需要的button，默认显示删除、添加、编辑 3个按钮
public class QrCreateController extends CommonListController<CategoryAdminVO> {
}
