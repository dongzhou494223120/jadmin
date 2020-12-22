package com.jadmin.vo.entity.base;

import com.jadmin.vo.fundation.base.AbstractValueObject;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description: 产品管理表
 * @Author: dongzhou
 * @CreateDate: 2020/12/20 13:02
 */
@Entity
@Data
@Table(name = "category_admin")
public class CategoryAdminVO extends AbstractValueObject {
    /** 序列号 */
    private static final long serialVersionUID = -5452735218569309710L;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String categoryId;

    @Column(length = 1024)
    private String seq;

    @Column(length = 128)
    private String categoryName;


    @Column(length = 1)
    private String isDelete;

    @Column(length = 19)
    private String operateTime;

    @Column(length = 32)
    private String operatorId;
    @Column(length = 1)
    private String billStatus;
    @Column(length = 50)
    private String type;

    @Column(length = 512)
    private String memo;

    @Override
    public String getPrimaryKey() {
        return categoryId;
    }

    @Override
    public void setPrimaryKey(String key) {
        this.categoryId = key;
    }
}
