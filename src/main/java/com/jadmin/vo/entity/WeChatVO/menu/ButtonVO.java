package com.jadmin.vo.entity.WeChatVO.menu;

import lombok.Data;

import java.util.List;

/**
 * @Description: java类作用描述
 * @Author: dongzhou
 * @CreateDate: 2020/12/24 15:34
 */
@Data
public class ButtonVO {
    /**
     * 菜单的响应动作类型，view表示网页类型，click表示点击类型，miniprogram表示小程序类型
     */
    private String type;
    /**
     * 菜单名称
     */
    private  String name;
    /**
     * 地址
     */
    private String url;
    /**
     *菜单KEY值，用于消息接口推送，不超过128字节
     */
    private String  key;

    List<ButtonVO> sub_button;
}
