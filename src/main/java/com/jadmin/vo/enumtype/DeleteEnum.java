package com.jadmin.vo.enumtype;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @Description: 删除标志枚举
 * @Author: dongzhou
 * @CreateDate: 2020/12/27 18:25
 */
@AllArgsConstructor
public enum DeleteEnum {
    N("0", "未删除"),
    Y("1", "已删除");


    private @Getter String code;
    private @Getter String msg;








}
