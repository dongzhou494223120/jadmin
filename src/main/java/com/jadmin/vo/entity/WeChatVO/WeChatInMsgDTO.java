package com.jadmin.vo.entity.WeChatVO;

import lombok.Data;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

/**
 * @Description: 微信请求消息
 * @Author: dongzhou
 * @CreateDate: 2020/8/13 20:46
 */
@Data
@XmlRootElement(name="xml")
@XmlAccessorType(XmlAccessType.FIELD)
public class WeChatInMsgDTO
//        extends WeChatBaseDTO
        implements Serializable {
    private static final long serialVersionUID = -8547654393188994987L;

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

   /***************************************************/


    /**
     * 图片链接（由系统生成）
     */
    private String PicUrl;
    /**
     * 图片消息媒体id，可以调用获取临时素材接口拉取数据。
     * 语音消息媒体id，可以调用获取临时素材接口拉取数据。
     */
    private String MediaId;
    /**
     * 语音格式，如amr，speex等
     */
    private String Format;
    /**
     * 消息id，64位整型
     */
    private Long MsgId;

    /**
     * 事件类型 subscribe(订阅)、unsubscribe(取消订阅)
     */
    private String Event;
    /**
     * 菜单类型的KeyR
     */
    private String EventKey;
}
