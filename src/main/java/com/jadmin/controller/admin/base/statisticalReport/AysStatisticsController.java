package com.jadmin.controller.admin.base.statisticalReport;

import com.jadmin.modules.annotation.AdminPage;
import com.jadmin.modules.annotation.column.TableColumn;
import com.jadmin.modules.annotation.list.*;
import com.jadmin.modules.controller.base.CommonListController;
import com.jadmin.vo.entity.base.AysStatisticsVO;
import com.jadmin.vo.enumtype.AdminPageMenu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.persistence.Column;

/**
 * @Description: java类作用描述
 * @Author: dongzhou
 * @CreateDate: 2020/12/23 19:50
 */
@Controller
@RequestMapping("/statistical") // 定义前台url访问的基础路径
@TableHql(value = "isDelete = 0", orderBy = "recommenderCount desc")
@SearchMode()
@DeleteMode(DeleteMode.DELETE) // 定义删除策略为真删
@AdminPage(menu = AdminPageMenu.statisticalReport, name = "推荐人统计") // 声明后台管理页面左边的菜单属性，用来控制权限
@FileConfig(selfJsp = {"edit"}) // 只通用 admin/common/date-list.jsp，edit跳到自己默认的jsp页面
//@AdminPageNoButton({"toShow"}) // 声明页面中不需要的button，默认显示删除、添加、编辑 3个按钮
public class AysStatisticsController extends CommonListController<AysStatisticsVO> {


    @TableColumn(value = "推荐人")
    private String recommenderName;

    @TableColumn(value = "推荐次数")
    private Integer recommenderCount;
}
