package com.jadmin.controller.admin;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.jadmin.modules.util.DictinfoUtils;
import com.jadmin.vo.entity.base.CategoryAdminVO;
import com.jadmin.vo.entity.base.DictkindVO;
import net.sf.json.JSONObject;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jadmin.modules.annotation.MethodLog;
import com.jadmin.modules.annotation.NoNeedLogin;
import com.jadmin.modules.controller.base.BaseAbstractController;
import com.jadmin.modules.util.StartCacheUtil;
import com.jadmin.modules.util.StaticPageUtils;
import com.jadmin.util.UserAgentUtil;
import com.jadmin.vo.entity.base.UserVO;

import java.util.HashMap;
import java.util.Map;

/**
 * @Title:web框架
 * @Description:无需登录就能访问的控制层
 * @Copyright:JAdmin (c) 2018年08月21日
 * @author:-jiujiya
 * @version:1.0
 */
@Controller
@NoNeedLogin //需登录就能访问,免登录
public class NoNeedLoginController extends BaseAbstractController {

    /**
     * 登陆页面
     *
     * @return
     */
    @RequestMapping({"/", "/login"})
    public String login(HttpServletRequest request) {
        return "admin/login";
    }

    /**
     * 登录用户
     *
     * @return
     */
    @RequestMapping({"/toLogin"})
    @MethodLog(type = "登陆")
    public @ResponseBody
    Object toLogin(String account, String password, HttpServletRequest request) {
        UserVO vo = systemDao.login(account, password);
        getClientENV(request.getSession()).setCurUser(vo);
        // 登陆次数+1
        systemDao.upLastLogin(UserAgentUtil.getRemoteAddr(request), vo.getUserId());
        return getRuturnJsonMap();
    }

    /**
     * 刷新静态化页面
     */
    @RequestMapping(value = "/flushPage")
    public @ResponseBody
    Object flushPage(String url, HttpServletRequest request) {
        StaticPageUtils.flushPage(url);
        return getRuturnJsonMap();
    }

    /**
     * 刷新缓存
     */
    @RequestMapping(value = "/flushStaticData")
    public @ResponseBody
    Object flushStaticData(String keys, HttpServletRequest request) {
        StartCacheUtil.refurbish(keys);
        return getRuturnJsonMap();
    }


    /**
     * 获取编码
     */
    @RequestMapping(value = "/getDictionaries")
    public @ResponseBody
    Object getCode(HttpServletRequest request) {
        DictkindVO vo = DictinfoUtils.getDictkind("REFERENCES", request);
        DictkindVO vo1 = DictinfoUtils.getDictkind("CATEGORY", request);
        Map<String, Object> map = new HashMap<>();
        map.put("REFERENCES", vo.getDictinfoLevels());
        map.put("CATEGORY", vo1.getDictinfoLevels());
        return map;
    }

    /**
     * 获取编码
     */
    @RequestMapping(value = "/getCodeVo")
    public @ResponseBody
    Object getCodeVo(@RequestBody CategoryAdminVO vo, HttpServletRequest request) {
        System.out.println(vo);
        String a = JSON.toJSONString(vo);
        return a;
    }


}