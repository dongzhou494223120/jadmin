package com.jadmin.vo.entity.base;

import lombok.Data;

import java.io.Serializable;

/**
 * @Description: java类作用描述
 * @Author: dongzhou
 * @CreateDate: 2020/12/26 22:20
 */
@Data
public class QrCodeVO  implements Serializable {
    /**
     * 分销商id
     */
    private String roleId;
    /**
     * 系列名称
     */
    private String seriesId;
    /**
     * 积分
     */
    private Integer integral;
    /**
     * 数量
     */
    private Integer count;
    /**
     * 描述
     */
    private String ms;


    /**
     * 类型
     */

    private Integer qr_type;
}
