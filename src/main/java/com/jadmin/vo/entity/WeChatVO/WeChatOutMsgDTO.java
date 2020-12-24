package com.jadmin.vo.entity.WeChatVO;

import lombok.Data;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;


/**
 * @Description: 微信请求消息
 * @Author: dongzhou
 * @CreateDate: 2020/8/13 20:46
 */
@Data
@XmlRootElement(name = "xml")
@XmlAccessorType(XmlAccessType.FIELD)
public class WeChatOutMsgDTO  extends WeChatBaseDTO{

    /**
     * 图片链接（由系统生成）
     */
    private String PicUrl;
    /**
     * 图片消息媒体id，可以调用获取临时素材接口拉取数据。
     * 语音消息媒体id，可以调用获取临时素材接口拉取数据。
     */
    @XmlElementWrapper(name = "Image")
    private String[] MediaId;
    /**
     * 语音格式，如amr，speex等
     */
    private String Format;
    /**
     * 事件类型 subscribe(订阅)、unsubscribe(取消订阅)
     */
    private String Event;
    /**
     * 图文个数
     */
    private Integer ArticleCount;
    /**
     * 图文列表明细
     */
    @XmlElementWrapper(name = "Articles")
    private ArticlesItem[] item;

}
