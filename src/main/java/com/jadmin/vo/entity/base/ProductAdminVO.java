package com.jadmin.vo.entity.base;

import com.jadmin.vo.fundation.base.AbstractValueObject;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * @Description: java类作用描述
 * @Author: dongzhou
 * @CreateDate: 2020/12/21 12:34
 */
@Entity
@Data
@Table(name = "product_admin")
public class ProductAdminVO extends AbstractValueObject {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String productId; //主键
    @Column(length = 1024)
    private String seq;//序列号
    @Column(length = 128)
    private String productName;//类别名称
    @Column(length = 128)
    private String seriesName;//系列名称
    @Column(length = 128)
    private String specifName;//规格名名称
    @Column(length = 10)
    private BigDecimal price;//单价
    @Column(length = 10)
    private String integral;//积分
    @Column(length = 128)
    private String isDelete;//是否删除
    @Column(length = 19)
    private String operateTime;//操作时间
    @Column(length = 32)
    private String operatorId;//操作人
    @Column(length = 1)
    private String billStatus;//是否可用
    @Column(length = 512)
    private String memo;//描述
    @Override
    public String getPrimaryKey() {
        return productId;
    }

    @Override
    public void setPrimaryKey(String key) {
        this.productId = key;
    }

}
