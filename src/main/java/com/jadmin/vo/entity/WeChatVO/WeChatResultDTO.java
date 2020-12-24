package com.jadmin.vo.entity.WeChatVO;

import lombok.Data;

/**
 * @Description: java类作用描述
 * @Author: dongzhou
 * @CreateDate: 2020/8/15 16:38
 */
@Data
public class WeChatResultDTO {
    /**
     * 密匙
     */
    private String access_token;
    /**
     * 有效时间
     */
    private Long expires_in;
    /**
     * 错误编码
     */
    private String errcode;
    /**
     * 错误描述
     */
    private String errmsg;
}
