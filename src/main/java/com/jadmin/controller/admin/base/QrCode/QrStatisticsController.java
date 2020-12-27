package com.jadmin.controller.admin.base.QrCode;

import com.jadmin.modules.annotation.AdminPage;
import com.jadmin.modules.annotation.column.FormColunm;
import com.jadmin.modules.annotation.column.TableColumn;
import com.jadmin.modules.annotation.list.AdminPageNoButton;
import com.jadmin.modules.annotation.list.DeleteMode;
import com.jadmin.modules.annotation.list.FileConfig;
import com.jadmin.modules.annotation.list.SearchMode;
import com.jadmin.modules.controller.base.CommonListController;
import com.jadmin.vo.entity.base.CategoryAdminVO;
import com.jadmin.vo.entity.base.RQcodeStatisticsVO;
import com.jadmin.vo.enumtype.AdminPageMenu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.persistence.Column;
import javax.servlet.http.HttpServletRequest;

/**
 * @Description: java类作用描述
 * @Author: dongzhou
 * @CreateDate: 2020/12/27 12:44
 */
@Controller
@RequestMapping("/statistics") // 定义前台url访问的基础路径
//@TableHql(value = "isDelete = 0", orderBy = "operateTime desc")
@SearchMode()
@DeleteMode(DeleteMode.DELETE) // 定义删除策略为真删
@AdminPage(menu = AdminPageMenu.qrCode, name = "二维码报表") // 声明后台管理页面左边的菜单属性，用来控制权限
@FileConfig(selfJsp = {"edit"}) // 只通用 admin/common/date-list.jsp，edit跳到自己默认的jsp页面
@AdminPageNoButton({"toUpdate", "toAdd", "del","toShow"}) // 声明页面中不需要的button，默认显示删除、添加、编辑 3个按钮
public class QrStatisticsController extends CommonListController<RQcodeStatisticsVO> {
    // "toShow"



    @FormColunm(value = "分销商", selectCode = "REFERENCES",edit = "false")
    @TableColumn
    private String distributorId;

    @FormColunm(value = "二维码生成数量")
    @TableColumn
    private Integer rqGenerateNumber;

//    @FormColunm(value = "系列名称")
//    @TableColumn
//    private String seriesName;

    @FormColunm(value = "总积分")
    @TableColumn
    private String totalPoints;



    @FormColunm(value = "操作时间")
    @TableColumn
    private String operateTime;

    @FormColunm(value = "操作人")
    @TableColumn
    private String operatorId;

    @FormColunm(value = "描述")
    @TableColumn
    private String memo;



}
