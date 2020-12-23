package com.jadmin.vo.entity.base;

import com.jadmin.vo.fundation.base.AbstractValueObject;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * @Description: 推荐人记录表
 * @Author: dongzhou
 * @CreateDate: 2020/12/23 19:42
 */
@Entity
@Data
@Table(name = "sys_statistics")
public class AysStatisticsVO extends AbstractValueObject {
    private static final long serialVersionUID = -6443970036153952109L;

    //主键id
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String id;
    //推荐人id
    @Column(length = 32)
    private String recommenderId;
    //推荐人姓名
    @Column(length = 32)
    private String recommenderName;
    //推荐次数
    @Column(length = 10)
    private Integer recommenderCount;

    //操作时间
    @Column(length = 32)
    private String operateTime;
    //操作人
    @Column(length = 32)
    private String operatorId;
    //是否删除'
    @Column(length = 1)
    private String isDelete;

    @Override
    public String getPrimaryKey() {
        return id;
    }

    @Override
    public void setPrimaryKey(String key) {
        this.id = key;
    }
}
