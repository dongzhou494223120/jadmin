package com.jadmin;

import com.jadmin.vo.entity.base.CategoryAdminVO;
import net.sf.json.JSON;
import org.json.simple.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class WebApplicationTests {

	@Test
	public void contextLoads() {
		CategoryAdminVO vo=new CategoryAdminVO();
		vo.setSeq("1");
		vo.setType("类型");
		vo.setIsDelete("删除");
		vo.setBillStatus("4");
		JSONObject json=vo.toJson();

	System.out.println(vo.toString());
		System.out.println(	json.toString());
	}

//	CREATE TABLE `category_admin` (
//			`categoryId` varchar(32) NOT NULL COMMENT '主键',
//			`seq` varchar(1024) NOT NULL COMMENT '序列号',
//			`categoryName` varchar(128) NOT NULL COMMENT '类别名称',
//			`state` varchar(10) DEFAULT NULL COMMENT '状态',
//			`isDelete` char(1) NOT NULL COMMENT '是否删除',
//			`operateTime` varchar(19) NOT NULL COMMENT '操作时间',
//			`operatorId` varchar(32) NOT NULL COMMENT '操作人',
//			`billStatus` char(1) NOT NULL COMMENT '是否可用',
//			`memo` varchar(512) DEFAULT NULL COMMENT '描述',
//	PRIMARY KEY (`categoryId`)
//) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类别管理';


}
