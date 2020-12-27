package com.jadmin.vo.entity.base;

import com.jadmin.modules.annotation.column.FormColunm;
import com.jadmin.vo.fundation.base.AbstractValueObject;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * @Description: 二维码统计表
 * @Author: dongzhou
 * @CreateDate: 2020/12/27 12:39
 */
@Entity
@Data
@Table(name = "rqcode_statistics")
public class RQcodeStatisticsVO extends AbstractValueObject {

    //主键id
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String id;
    @Column(length = 32)
    private String distributorId;//分销商id',
    @Column(length = 32)
    private String distributorName;//分销商姓名',
    @Column(length = 10)
    private Integer rqGenerateNumber;//二维码生成数量',
    @Column(length = 10)
    private Integer totalPoints;//总积分',

    @Column(length = 300)
    private String seriesName;
    @Column(length = 32)
    private String operateTime;//操作时间',
    @Column(length = 32)
    private String operatorId;//操作人',
    @Column(length = 1)
    private String isDelete;//是否删除'
    @FormColunm(value = "描述", type = "textarea", length = 512, required = false)
    public String memo;

    @Override
    public String getPrimaryKey() {
        return id;
    }

    @Override
    public void setPrimaryKey(String key) {
        this.id = key;
    }

}
