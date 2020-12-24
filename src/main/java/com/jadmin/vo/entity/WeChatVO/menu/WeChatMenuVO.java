package com.jadmin.vo.entity.WeChatVO.menu;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description: java类作用描述
 * @Author: dongzhou
 * @CreateDate: 2020/12/24 15:32
 */
@Data
public class WeChatMenuVO {

    List<ButtonVO>  button=new ArrayList<>(3);
}
