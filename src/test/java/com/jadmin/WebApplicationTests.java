package com.jadmin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class WebApplicationTests {

	@Test
	public void contextLoads() {
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
