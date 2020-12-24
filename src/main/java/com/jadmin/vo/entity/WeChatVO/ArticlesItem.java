package com.jadmin.vo.entity.WeChatVO;

import lombok.Data;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @Description: java类作用描述
 * @Author: dongzhou
 * @CreateDate: 2020/8/15 14:34
 */
@Data
@XmlRootElement(name="xml")
@XmlAccessorType(XmlAccessType.FIELD)
public class ArticlesItem {
    /**
     * 是	图文消息标题
     */
    private String Title;
    /**
     * 是	图文消息描述
     */
    private String Description;
    /**
     * 是	图片链接，支持JPG、PNG格式，较好的效果为大图360*200，小图200*200
     */
    private String PicUrl;
    /**
     * 是	点击图文消息跳转链接
     */
    private String Url;

}
