package com.jadmin.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import com.jadmin.modules.exception.BusinessException;
import com.jadmin.modules.itf.GeneralOperatUtils;
import com.jadmin.vo.entity.base.*;
import com.jadmin.vo.enumtype.DeleteEnum;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jadmin.dao.SystemDao;
import com.jadmin.modules.annotation.MethodLog;
import com.jadmin.modules.controller.base.BaseAbstractController;
import com.jadmin.modules.util.AdminPageUtils;
import com.jadmin.modules.util.DictinfoUtils;
import com.jadmin.modules.util.encode.Encode;
import com.jadmin.util.DateTimeUtil;
import com.jadmin.vo.fundation.controller.AdminPageMenuVO;
import com.jadmin.vo.fundation.tool.Commons;

import lombok.extern.slf4j.Slf4j;

/**
 * @Title:web框架
 * @Description:前台的控制层
 * @Copyright:JAdmin (c) 2018年08月21日
 * @author:-jiujiya
 * @version:1.0
 */
@Controller
@Slf4j
public class CommonController extends BaseAbstractController {

    @Autowired
    private SystemDao systemDao;


    /**
     * @param request
     * @return
     */
    @RequestMapping({"/admin"})
    public String admin(HttpServletRequest request) {
        // 給据用户角色获取权限 获取用户拥有的菜单、页面、按钮
        UserVO user = getCurUser(request.getSession());
        List<AdminPageMenuVO> menus = AdminPageUtils.getHasAdminPageMenus(user.getRole());
        request.setAttribute("menus", menus);
        getClientENV(request.getSession()).setAdminPageMenus(menus);
        request.setAttribute("mustPsChange", getMustPsChange(user));
        return "admin/index";
    }

    /**
     * 查看是否需要修改密码
     *
     * @param user
     * @return
     */
    private boolean getMustPsChange(UserVO user) {
        String PSCHANGE_MONTH = Commons.getConfigValue("PSCHANGE_MONTH", "-1");
        if (StringUtils.isNotBlank(user.getPsChangeTime()) || "-1".equals(PSCHANGE_MONTH)) return false;
        String ts = DateTimeUtil.getLastMonthTime(Integer.parseInt(PSCHANGE_MONTH));
        // 如果数据库的时间，比一年前的时间还要小，就需要强制更新密码
        if (user.getPsChangeTime().compareTo(ts) <= 0) {
            return true;
        }
        return false;
    }

    /**
     * 我的桌面
     *
     * @return
     */
    @RequestMapping({"/welcome"})
    public String welcome(String pageNo, String pageSize, HttpServletRequest request) {
        UserVO curUser = getClientENV(request.getSession()).getCurUser();
        // 获取备忘笺
        request.setAttribute("memorandums", systemDao.getMemorandum(curUser.getUserId(), 1, 5));
        return "admin/welcome";
    }

    /**
     * @param request
     * @return
     */
    @RequestMapping({"/dictinfoCheckbox"})
    public String dictinfoCheckbox(String code, String name, String values, HttpServletRequest request) {
        // 获取数据词典的值
        DictkindVO dictkind = DictinfoUtils.getDictkind(code, request);
        dictkind.setDictinfoLevels(dictkind.getDictinfos());
        request.setAttribute("dictkind", dictkind);
        request.setAttribute("hasDictkind", "," + values + ",");
        // 获取默认的选中值
        return "admin/common/dictinfo-checkbox";
    }

    /**
     * 退出
     *
     * @return
     */
    @RequestMapping({"/quit"})
    public String quit(HttpServletRequest request) {
        getClientENV(request.getSession()).setCurUser(null);
        request.getSession().invalidate();
        return "admin/login";
    }

    /**
     * 跳转到修改密码页面
     */
    @RequestMapping({"/pwd"})
    public String toPwd(String account, String password, HttpServletRequest request) {
        return "admin/common/pwd";
    }

    /**
     * 修改密码操作
     *
     * @author zh
     */
    @RequestMapping({"/toModifyPwd"})
    @MethodLog(type = "修改密码")
    public @ResponseBody
    String toModifyPwd(String password, String newPassword, HttpServletRequest request) {
        password = Encode.encode(password, true);
        UserVO userVO = systemDao.queryPwdForUserId(getCurUser(request.getSession()).getUserId(), password);
        //判断用户输入的老密码是否和数据库一致
        if (userVO.getPassword().equals(password)) {
//			String newPassword = request.getParameter("newPassword");
            newPassword = Encode.encode(newPassword, true);
            userVO.setPassword(newPassword);
            userVO.setPsChangeTime(getTs());
            systemDao.saveOrUpdate(userVO);
            getClientENV(request.getSession()).setCurUser(userVO);
            return success;
        } else {
            return userVO.toString();
        }
    }

    /**
     * 跳转到重置密码页面，重置密码不需要输入老密码验证
     *
     * @author zh
     */
    @RequestMapping({"/toResPwd"})
    @MethodLog(type = "重置密码")
    public @ResponseBody
    String toResPwd(String account, String password, HttpServletRequest request) {
        try {
            password = Encode.encode(password, true);
            String sql = "update sys_user set password = ? where account = ? and isdelete = 0";
            systemDao.getJdbcTemplate().update(sql, new Object[]{password, account});
            return success;
        } catch (Exception e) {
            log.error("密码修改失败" + e.getMessage(), e);
            return "修改失败!";
        }
    }

    /**
     * 保存便签
     */
    @RequestMapping(value = "/memoAjax/save")
    public @ResponseBody
    Object saveAjax(HttpServletRequest request, String value, String id) {
        String userId = getClientENV(request.getSession()).getCurUser().getUserId();
        MemorandumVO vo = new MemorandumVO();
        if (StringUtils.isNotBlank(id)) {
            vo = systemDao.getEntityManager().find(MemorandumVO.class, id);
        } else {
            vo.setIsDelete("0");
            vo.setOperatorId(userId);
            vo.setOperateTime(getTs());
        }
        vo.setContent(value);
        systemDao.saveOrUpdate(vo);
        Map<String, Object> map = new HashMap<>();
        map.put("status", true);
        map.put("id", vo.getPrimaryKey());
        return map;
    }

    /**
     * 保存便签
     */
    @RequestMapping(value = "/memoAjax/get")
    @SuppressWarnings("unchecked")
    public @ResponseBody
    Object getAjax(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        String userId = getClientENV(request.getSession()).getCurUser().getUserId();
        List<MemorandumVO> list = (List<MemorandumVO>) systemDao.getMemorandum(userId, 0, 1);
        if (list.isEmpty()) {
            map.put("id", "");
            map.put("value", "");
            map.put("date", "");
        } else {
            map.put("id", list.get(0).getPrimaryKey());
            map.put("value", list.get(0).getContent());
            map.put("date", list.get(0).getComOperateDate());
        }
        return map;
    }

    /**
     * 编辑器上传图片
     *
     * @return
     */
    @RequestMapping({"/kindeditorUpLoadPic"})
    public @ResponseBody
    String kindeditorUpLoadPic(HttpServletRequest request) {
        Map<String, Object> rMap = new HashMap<>();
        try {
            String filePath = upload(request, "imgFile", "/kindeditor");
            rMap.put("error", 0);
            rMap.put("url", filePath);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            rMap.put("error", 1);
            rMap.put("message", e.getMessage());
        }
        return getJsonMap(rMap).toString();
    }


    /**
     * 获取编码
     */
    @RequestMapping(value = "/util/getCode")
    public @ResponseBody
    Object getCode(HttpServletRequest request, String code) {
        DictkindVO vo = DictinfoUtils.getDictkind(code, request);
        return vo.getTreeJsonList();
    }

    public Boolean saveQRCodeStatistics(QrCodeVO vo, HttpServletRequest request) {
        String userName = getClientENV(request.getSession()).getCurUser().getName();
        if (StringUtils.isBlank(userName)) {
            //没有获取到操作人
        }
        String operateTime = GeneralOperatUtils.getCurDate();
        //查询今天有没有生成的
        String  hql="from RQcodeStatisticsVO where distributorId ='"+vo.getRoleId()+"'  and operateTime='"+operateTime+"' and isDelete = 0 ";
        List<RQcodeStatisticsVO> list = (List<RQcodeStatisticsVO>)systemDao.getCacheDataByHSql(hql, "hql");
        if (list.isEmpty()) {
            RQcodeStatisticsVO rqVo = new RQcodeStatisticsVO();
            rqVo.setOperatorId(userName);
            rqVo.setOperateTime(GeneralOperatUtils.getCurDate());
            rqVo.setIsDelete(DeleteEnum.N.getCode());
//            rqVo.setSeriesName("系列");

            rqVo.setTotalPoints(vo.getIntegral());
//            rqVo.setDistributorName("分销商名字");
            rqVo.setDistributorId(vo.getRoleId());
            rqVo.setRqGenerateNumber(vo.getCount());
            rqVo.setMemo(vo.getMs());
            systemDao.saveOrUpdate(rqVo);
        } else {
            RQcodeStatisticsVO oldVO = list.get(0);
            oldVO.setId(oldVO.getId());
            //积分相加
            oldVO.setTotalPoints(oldVO.getTotalPoints()+vo.getIntegral());
            oldVO.setRqGenerateNumber(oldVO.getRqGenerateNumber()+vo.getCount());
            oldVO.setMemo(vo.getMs());
            systemDao.saveOrUpdate(oldVO);
        }


        return null;
    }

}