package com.jadmin.vo.entity.WeChatVO;

import lombok.Data;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

/**
 * @Description: 微信请求消息基础类型
 * @Author: dongzhou
 * @CreateDate: 2020/8/13 18:52
 */
@Data
@XmlRootElement(name="xml")
@XmlAccessorType(XmlAccessType.FIELD)
public class WeChatBaseDTO implements Serializable {


    private static final long serialVersionUID = -4623120270854727591L;
    /**
     * 开发者微信号
     */
    private String ToUserName;
    /**
     * 发送方帐号（一个OpenID）
     */
    private String FromUserName;
    /**
     * 消息创建时间 （整型）
     */
    private Long CreateTime;
    /**
     * 消息类型，文本为text
     */
    private String MsgType;

    /**
     * 文本消息内容
     */
    private String Content;
}
