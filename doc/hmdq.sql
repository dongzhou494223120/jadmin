/*
 Navicat Premium Data Transfer

 Source Server         : hm
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : hulili.love:3306
 Source Schema         : hmdq

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 23/12/2020 11:27:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category_admin
-- ----------------------------
DROP TABLE IF EXISTS `category_admin`;
CREATE TABLE `category_admin`  (
  `categoryId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `seq` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序列号',
  `categoryName` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称',
  `isDelete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `operateTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作时间',
  `operatorId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `billStatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否可用',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品类型:CATEGORY类别，规格SPECIF',
  PRIMARY KEY (`categoryId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '类别管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_admin
-- ----------------------------
INSERT INTO `category_admin` VALUES ('4028859876898c760176898dbfee0004', '3', '大类', '0', '2020-12-22 16:25:36', '系统管理员', '1', '打算', 'CATEGORY');
INSERT INTO `category_admin` VALUES ('ff8080817688131b017688aede130007', '1', '1大类', '0', '2020-12-22 12:22:10', '系统管理员', '1', '', 'CATEGORY');
INSERT INTO `category_admin` VALUES ('ff8080817688131b017688af02030009', '2', '2大类', '0', '2020-12-22 12:22:19', '系统管理员', '1', '', 'CATEGORY');

-- ----------------------------
-- Table structure for product_admin
-- ----------------------------
DROP TABLE IF EXISTS `product_admin`;
CREATE TABLE `product_admin`  (
  `productId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `seq` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序列号',
  `productName` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称',
  `seriesName` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系列名称',
  `specifName` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格名名称',
  `price` decimal(10, 2) NOT NULL COMMENT '单价',
  `integral` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '积分',
  `isDelete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `operateTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作时间',
  `operatorId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `billStatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否可用',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`productId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_admin
-- ----------------------------
INSERT INTO `product_admin` VALUES ('402885987683e4ee017683e617dd0002', '1', '34', '哈哈', '324345', 34.68, '1', '0', '2020-12-21 14:39:35', '系统管理员', '1', '345');
INSERT INTO `product_admin` VALUES ('40288598768968290176896e8fbe0002', '1', '类别吧', '234', '萨达', 3.43, '1', '0', '2020-12-22 15:51:08', '系统管理员', '1', '');
INSERT INTO `product_admin` VALUES ('40288598768968290176897146900004', '2', '类别爱上', '洗了', '324345', 34.78, '3', '0', '2020-12-22 15:54:30', '系统管理员', '1', '');
INSERT INTO `product_admin` VALUES ('40289f6c76856c9a017685767b5f0002', '345', '345', '345', '345', 345.00, '345', '0', '2020-12-21 21:21:43', '系统管理员', '1', '');
INSERT INTO `product_admin` VALUES ('ff8080817688131b01768828631b0002', '1', '类别', '规格', '324', 34.53, '3', '0', '2020-12-22 09:55:16', '系统管理员', '', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `configId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `coValue` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '值',
  `isOpen` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否允许在界面中编辑 1-是，0-否',
  `operateTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作时间',
  `operatorId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `billStatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态 1正常 0禁用',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`configId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('4028802a53fa3a750153fa42a81f0001', '默认分页数量', 'DEF_PAGESIZE', '10', '1', '2018-10-30 10:48:14', 'admin', '1', '');
INSERT INTO `sys_config` VALUES ('402880df66e69f0f0166e6ac51e5000b', '密码多久强制修改一次', 'PSCHANGE_MONTH', '-1', '1', '2018-11-06 09:39:04', 'admin', '1', '单位为月，如果为-1，不强制修改，如果为正数，{PSCHANGE_MONTH}月份修改一次，并且第一次登陆的时候，需要强制修改密码。');
INSERT INTO `sys_config` VALUES ('4028818451b28de40151b290f7bd0002', '项目名称', 'DEF_PROJECT_NAME', '汇迈电器', '1', '2017-11-26 08:50:23', 'admin', '1', '');
INSERT INTO `sys_config` VALUES ('402881ef4f4f615d014f4f6ab3530001', '用户默认密码', 'DEF_PASSWORD', '111111', '1', '2017-11-26 10:10:10', 'admin', '1', '用户默认密码');

-- ----------------------------
-- Table structure for sys_dictinfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictinfo`;
CREATE TABLE `sys_dictinfo`  (
  `dictinfoId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典ID',
  `dictkindId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典父ID',
  `dictinfoFid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '如果是2级以上的，需要fid',
  `name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名字',
  `code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典编号',
  `sort` int(10) DEFAULT 0 COMMENT '排序，小的在前面',
  `level` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '级别，默认1级，二级菜单的话是二级',
  `billStatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态 1正常 0禁用',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典描述',
  PRIMARY KEY (`dictinfoId`) USING BTREE,
  INDEX `dictinfoId`(`dictinfoId`) USING BTREE,
  INDEX `FK_424ee705f050418c9e21d86f307`(`dictkindId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictinfo
-- ----------------------------
INSERT INTO `sys_dictinfo` VALUES ('1000', '100', NULL, '男', '1', 0, '1', '1', '');
INSERT INTO `sys_dictinfo` VALUES ('1001', '100', NULL, '女', '2', 1, '1', '1', '');
INSERT INTO `sys_dictinfo` VALUES ('1002', '101', NULL, '启用', '1', 0, '1', '1', NULL);
INSERT INTO `sys_dictinfo` VALUES ('1003', '101', NULL, '停用', '0', 1, '1', '1', NULL);
INSERT INTO `sys_dictinfo` VALUES ('1004', '103', NULL, '人工添加', '0', 0, '1', '1', NULL);
INSERT INTO `sys_dictinfo` VALUES ('1005', '103', NULL, '动态获取', '1', 0, '1', '1', NULL);
INSERT INTO `sys_dictinfo` VALUES ('1006', '104', NULL, '单选', '1', 0, '1', '1', '');
INSERT INTO `sys_dictinfo` VALUES ('1007', '104', NULL, '多选', '2', 0, '1', '1', '');
INSERT INTO `sys_dictinfo` VALUES ('4028818b53e5f7930153e5f9ffb00006', '4028818b53e5f7930153e5f9c5450004', NULL, '是', '1', 1, '1', '1', '');
INSERT INTO `sys_dictinfo` VALUES ('4028818b53e5f7930153e5fa1d620008', '4028818b53e5f7930153e5f9c5450004', NULL, '否', '0', 2, '1', '1', '');
INSERT INTO `sys_dictinfo` VALUES ('4028f681658892890165889d66ce0012', '4028f681658892890165889701830001', NULL, '执行中', '5', 6, '1', '1', '');
INSERT INTO `sys_dictinfo` VALUES ('4028f681658892890165889df5e40015', '4028f681658892890165889701830001', NULL, '错误', '4', 5, '1', '1', '');
INSERT INTO `sys_dictinfo` VALUES ('4028f681658892890165889e41150017', '4028f681658892890165889701830001', NULL, '完成', '3', 4, '1', '1', '');
INSERT INTO `sys_dictinfo` VALUES ('4028f681658892890165889ef1190019', '4028f681658892890165889701830001', NULL, '暂停', '2', 3, '1', '1', '');
INSERT INTO `sys_dictinfo` VALUES ('4028f681658892890165889f246d001b', '4028f681658892890165889701830001', NULL, '正常', '1', 2, '1', '1', '');
INSERT INTO `sys_dictinfo` VALUES ('4028f681658892890165889f6251001d', '4028f681658892890165889701830001', NULL, '不存在', '0', 1, '1', '1', '');
INSERT INTO `sys_dictinfo` VALUES ('4028f68166519330016651a0fbdb0002', '4028f68166519330016651a0a4cc0000', NULL, '启用', '1', 1, '1', '1', '');
INSERT INTO `sys_dictinfo` VALUES ('4028f68166519330016651a142ff0004', '4028f68166519330016651a0a4cc0000', NULL, '禁用', '0', 2, '1', '1', '');

-- ----------------------------
-- Table structure for sys_dictkind
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictkind`;
CREATE TABLE `sys_dictkind`  (
  `dictkindId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典种类ID',
  `code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '种类编号',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典种类名称',
  `isDynamic` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否是动态的，动态查询数据库的为1，否则0',
  `dynSql` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '如果字典的属性值不是固定的，就查询sql',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '字典类别类型，详见数据字典',
  `isOpen` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否允许在界面中编辑 1-是，0-否',
  `operateTime` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `billStatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态 1正常 0禁用',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典描述',
  PRIMARY KEY (`dictkindId`) USING BTREE,
  INDEX `dictkindId`(`dictkindId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典种类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictkind
-- ----------------------------
INSERT INTO `sys_dictkind` VALUES ('100', 'sex', '性别', '0', '', '1', '1', '2015-08-25 14:06:16', '1', '性别分类');
INSERT INTO `sys_dictkind` VALUES ('101', 'billStatus', '是否启用', '0', '', '1', '1', '2015-08-25 14:06:16', '1', '是否启用');
INSERT INTO `sys_dictkind` VALUES ('102', 'userRole', '用户角色', '1', 'SELECT roleId id, roleName name FROM sys_role WHERE billStatus = 1', '1', '1', '2015-08-25 14:06:16', '1', '');
INSERT INTO `sys_dictkind` VALUES ('103', 'isDynamic', '字典属性类别', '0', NULL, '1', '1', '2015-08-25 14:06:16', '1', NULL);
INSERT INTO `sys_dictkind` VALUES ('104', 'dictkindType', '字典种类类别', '0', '', '1', '1', '2015-08-25 14:06:16', '1', '');
INSERT INTO `sys_dictkind` VALUES ('106', 'org', '机构列表（有权限控制）', '1', 'SELECT orgId rId, name, seq id, orgFSeq pId FROM sys_org WHERE billStatus = 1 and isDelete = 0', '1', '1', '2015-08-26 02:45:23', '1', '动态获取自己和子机构的orgId   and seq like \'${org.seq}%\'');
INSERT INTO `sys_dictkind` VALUES ('108', 'orgFSeq', '所属父机构', '1', 'SELECT seq id, name FROM sys_org WHERE billStatus = 1', '1', '1', '2015-09-02 16:02:22', '1', 'wu');
INSERT INTO `sys_dictkind` VALUES ('120', 'userDisRole', '可非配角色', '1', 'SELECT roleId id, roleName name FROM sys_role WHERE billStatus = 1', '2', '1', '2015-08-25 14:06:16', '1', '');
INSERT INTO `sys_dictkind` VALUES ('4028803a665678420166567dce8f0008', 'userName', '创建人', '1', 'SELECT userId id, name name FROM sys_user WHERE billStatus = 1', '1', '1', '2018-10-09 09:42:57', '1', '');
INSERT INTO `sys_dictkind` VALUES ('4028818b53e5f7930153e5f9c5450004', 'yesNo', '是否', '0', '', '1', '1', '2016-04-05 18:31:04', '1', '');
INSERT INTO `sys_dictkind` VALUES ('4028f681658892890165889701830001', 'SchedulerState', '调度状态', '0', '', '1', '1', '2018-08-30 10:08:42', '1', '');
INSERT INTO `sys_dictkind` VALUES ('4028f68166519330016651a0a4cc0000', 'quartzSwitch', '调度开关', '0', '', '1', '1', '2018-10-08 11:02:54', '1', '');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `logId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `orgId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '机构ID',
  `userId` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户ID',
  `url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求的url',
  `type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志内容',
  `clientIp` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户操作ip',
  `level` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '级别',
  `operateTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作时间',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`logId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('40288598768a3a1b01768a41d8580001', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '0:0:0:0:0:0:0:1', '1', '2020-12-22 19:42:19', NULL);
INSERT INTO `sys_log` VALUES ('40288598768a3a1b01768a41da940002', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '0:0:0:0:0:0:0:1', '1', '2020-12-22 19:42:20', NULL);
INSERT INTO `sys_log` VALUES ('40288598768a3a1b01768a4280b30004', NULL, 'admin', '/specif/edit', '新增', '产品管理>>规格管理>>新增：返回结果：public/close-layer，数据：{\"isDelete\":\"0\",\"operateTime\":\"2020-12-22 19:43:02\",\"billStatus\":\"1\",\"memo\":\"驱蚊器\",\"type\":\"SPECIF\",\"categoryName\":\"规格\",\"operatorId\":\"系统管理员\",\"categoryId\":\"40288598768a3a1b01768a4280720003\",\"seq\":\"1\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-22 19:43:02', NULL);
INSERT INTO `sys_log` VALUES ('40288598768a452601768a4551390001', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '0:0:0:0:0:0:0:1', '1', '2020-12-22 19:46:07', NULL);
INSERT INTO `sys_log` VALUES ('40288598768a452601768a4895b30003', NULL, 'admin', '/user/edit', '新增', '用户管理>>用户管理>>新增：返回结果：public/close-layer，数据：{\"role\":RoleVO(roleId=0, roleName=null, roleType=null, operateTime=null, operatorId=null, billStatus=null, memo=null, roleModule=[]),\"org\":4028803a65e549160165e549d6c00002,\"isDelete\":\"0\",\"sex\":\"1\",\"operateTime\":\"2020-12-22 19:49:41\",\"memo\":\"\",\"rqCode\":null,\"userId\":\"40288598768a452601768a4895700002\",\"loginCount\":0,\"lastLoginIp\":\" \",\"lastLoginTime\":\" \",\"password\":\"pnliiidgkneicjmb\",\"psChangeTime\":\"\",\"integral\":null,\"name\":\"张三\",\"billStatus\":\"1\",\"region\":\"阿萨德\",\"operatorId\":\"admin\",\"recommender\":\"瑜伽疼\",\"account\":\"19793083332\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-22 19:49:41', NULL);
INSERT INTO `sys_log` VALUES ('40288598768a4cb401768a4cd9ed0001', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '0:0:0:0:0:0:0:1', '1', '2020-12-22 19:54:21', NULL);
INSERT INTO `sys_log` VALUES ('40288598768a4cb401768a4d994a0003', NULL, 'admin', '/role/edit', '新增', '用户管理>>角色管理>>新增：返回结果：public/close-layer，数据：{\"roleId\":\"40288598768a4cb401768a4d99100002\",\"operateTime\":\"2020-12-22 19:55:09\",\"roleModule\":[],\"roleName\":\"分销商\",\"billStatus\":\"1\",\"memo\":\"\",\"roleType\":\"2\",\"operatorId\":\"admin\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-22 19:55:10', NULL);
INSERT INTO `sys_log` VALUES ('40288598768a4cb401768a4db58d0005', NULL, 'admin', '/role/edit', '新增', '用户管理>>角色管理>>新增：返回结果：public/close-layer，数据：{\"roleId\":\"40288598768a4cb401768a4db5570004\",\"operateTime\":\"2020-12-22 19:55:17\",\"roleModule\":[],\"roleName\":\"电工\",\"billStatus\":\"1\",\"memo\":\"\",\"roleType\":\"2\",\"operatorId\":\"admin\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-22 19:55:17', NULL);
INSERT INTO `sys_log` VALUES ('40288598768a4cb401768a4de5610007', NULL, 'admin', '/role/edit', '新增', '用户管理>>角色管理>>新增：返回结果：public/close-layer，数据：{\"roleId\":\"40288598768a4cb401768a4de52c0006\",\"operateTime\":\"2020-12-22 19:55:29\",\"roleModule\":[],\"roleName\":\"项目经理\",\"billStatus\":\"1\",\"memo\":\"\",\"roleType\":\"2\",\"operatorId\":\"admin\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-22 19:55:29', NULL);
INSERT INTO `sys_log` VALUES ('40288598768a4cb401768a4e6d580008', NULL, 'admin', '/role/edit', '修改', '用户管理>>角色管理>>修改：返回结果：public/close-layer，数据：{\"roleId\":\"40288598768a4cb401768a4db5570004\",\"operateTime\":\"2020-12-22 19:55:17\",\"roleModule\":[],\"roleName\":\"水电工\",\"billStatus\":\"1\",\"memo\":\"\",\"roleType\":\"2\",\"operatorId\":\"admin\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-22 19:56:04', NULL);
INSERT INTO `sys_log` VALUES ('40288598768a4cb401768a4f7d69000a', NULL, 'admin', '/user/edit', '新增', '用户管理>>用户管理>>新增：返回结果：public/close-layer，数据：{\"role\":RoleVO(roleId=40288598768a4cb401768a4d99100002, roleName=null, roleType=null, operateTime=null, operatorId=null, billStatus=null, memo=null, roleModule=[]),\"org\":4028803a65c7dffd0165c7e0c39c0001,\"isDelete\":\"0\",\"sex\":\"1\",\"operateTime\":\"2020-12-22 19:57:13\",\"memo\":\"\",\"rqCode\":null,\"userId\":\"40288598768a4cb401768a4f7d280009\",\"loginCount\":0,\"lastLoginIp\":\" \",\"lastLoginTime\":\" \",\"password\":\"pnliiidgkneicjmb\",\"psChangeTime\":\"\",\"integral\":null,\"name\":\"文件\",\"billStatus\":\"1\",\"region\":\"阿萨德\",\"operatorId\":\"admin\",\"recommender\":\"瑜伽疼\",\"account\":\"18694063332\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-22 19:57:13', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d3d7b01768d3dca9e0001', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 09:36:45', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d3fcb01768d3ff6d10001', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 09:39:08', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d4cf301768d4d18d70001', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 09:53:28', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d4cf301768d4e5ac40002', NULL, 'admin', '/user/edit', '新增', '用户管理>>用户管理>>新增：errorMsg：服务器异常，请稍后重试，数据：{\"role\":RoleVO(roleId=40288598768a4cb401768a4d99100002, roleName=null, roleType=null, operateTime=null, operatorId=null, billStatus=null, memo=null, roleModule=[]),\"org\":1,\"isDelete\":\"0\",\"sex\":\"1\",\"operateTime\":\"2020-12-23 09:54:32\",\"memo\":\"123\",\"rqCode\":null,\"userId\":\"\",\"loginCount\":0,\"lastLoginIp\":\" \",\"lastLoginTime\":\" \",\"password\":\"dogefiiognjigdog\",\"recommenderId\":null,\"psChangeTime\":\"\",\"integral\":null,\"name\":\"好坏\",\"billStatus\":\"1\",\"region\":\"业务额\",\"operatorId\":\"admin\",\"recommender\":\"1\",\"account\":\"18693074493\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 09:54:51', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d58fa01768d5932a90001', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 10:06:41', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d58fa01768d5a0b080002', NULL, 'admin', '/user/edit', '新增', '用户管理>>用户管理>>新增：返回结果：积分不能为空', '0:0:0:0:0:0:0:1', '1', '2020-12-23 10:07:37', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d5f8001768d5fc3450001', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 10:13:52', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d5f8001768d6400580002', NULL, 'admin', '/qrCode/del', '删除', '二维码>>二维码生成>>删除删除：返回结果：success，数量：1个', '0:0:0:0:0:0:0:1', '1', '2020-12-23 10:18:29', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d756601768d758bac0001', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 10:37:39', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d86d801768d86fcd30001', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 10:56:42', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d86d801768d880dd70002', NULL, 'admin', '/user/edit', '新增', '用户管理>>用户管理>>新增：errorMsg：推荐人电话号码不存在！，数据：{\"role\":RoleVO(roleId=40288598768a4cb401768a4db5570004, roleName=null, roleType=null, operateTime=null, operatorId=null, billStatus=null, memo=null, roleModule=[]),\"org\":1,\"isDelete\":\"0\",\"sex\":\"1\",\"operateTime\":\"2020-12-23 10:57:52\",\"memo\":\"\",\"rqCode\":null,\"userId\":\"\",\"loginCount\":0,\"lastLoginIp\":\" \",\"lastLoginTime\":\" \",\"password\":\"请问\",\"recommenderId\":null,\"psChangeTime\":\"\",\"integral\":null,\"name\":\"董洲3\",\"billStatus\":\"1\",\"region\":\"图区域\",\"operatorId\":\"admin\",\"recommender\":\"23\",\"account\":\"18695062227\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 10:57:52', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d86d801768d895cfa0003', NULL, 'admin', '/user/edit', '新增', '用户管理>>用户管理>>新增：errorMsg：推荐人电话号码不存在！，数据：{\"role\":RoleVO(roleId=40288598768a4cb401768a4db5570004, roleName=null, roleType=null, operateTime=null, operatorId=null, billStatus=null, memo=null, roleModule=[]),\"org\":1,\"isDelete\":\"0\",\"sex\":\"1\",\"operateTime\":\"2020-12-23 10:58:09\",\"memo\":\"\",\"rqCode\":null,\"userId\":\"\",\"loginCount\":0,\"lastLoginIp\":\" \",\"lastLoginTime\":\" \",\"password\":\"111111\",\"recommenderId\":null,\"psChangeTime\":\"\",\"integral\":null,\"name\":\"董洲3\",\"billStatus\":\"1\",\"region\":\"图区域\",\"operatorId\":\"admin\",\"recommender\":\"23\",\"account\":\"18695062227\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 10:59:18', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d86d801768d89c18f0004', NULL, 'admin', '/user/edit', '新增', '用户管理>>用户管理>>新增：errorMsg：推荐人电话号码不存在！，数据：{\"role\":RoleVO(roleId=40288598768a4cb401768a4db5570004, roleName=null, roleType=null, operateTime=null, operatorId=null, billStatus=null, memo=null, roleModule=[]),\"org\":1,\"isDelete\":\"0\",\"sex\":\"1\",\"operateTime\":\"2020-12-23 10:59:35\",\"memo\":\"\",\"rqCode\":null,\"userId\":\"\",\"loginCount\":0,\"lastLoginIp\":\" \",\"lastLoginTime\":\" \",\"password\":\"111111\",\"recommenderId\":null,\"psChangeTime\":\"\",\"integral\":null,\"name\":\"董洲3\",\"billStatus\":\"1\",\"region\":\"图区域\",\"operatorId\":\"admin\",\"recommender\":\"18695062221\",\"account\":\"18695062227\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 10:59:44', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d86d801768d8b56f70005', NULL, 'admin', '/user/edit', '新增', '用户管理>>用户管理>>新增：errorMsg：推荐人电话号码不存在！，数据：{\"role\":RoleVO(roleId=40288598768a4cb401768a4db5570004, roleName=null, roleType=null, operateTime=null, operatorId=null, billStatus=null, memo=null, roleModule=[]),\"org\":1,\"isDelete\":\"0\",\"sex\":\"1\",\"operateTime\":\"2020-12-23 11:00:36\",\"memo\":\"\",\"rqCode\":null,\"userId\":\"\",\"loginCount\":0,\"lastLoginIp\":\" \",\"lastLoginTime\":\" \",\"password\":\"111111\",\"recommenderId\":null,\"psChangeTime\":\"\",\"integral\":null,\"name\":\"贷款资料录入环节接口\",\"billStatus\":\"1\",\"region\":\"324\",\"operatorId\":\"admin\",\"recommender\":\"19793083332\",\"account\":\"18695062221\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 11:01:27', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d86d801768d8d63f40006', NULL, 'admin', '/user/edit', '新增', '用户管理>>用户管理>>新增：errorMsg：推荐人电话号码不存在！，数据：{\"role\":RoleVO(roleId=40288598768a4cb401768a4db5570004, roleName=null, roleType=null, operateTime=null, operatorId=null, billStatus=null, memo=null, roleModule=[]),\"org\":1,\"isDelete\":\"0\",\"sex\":\"1\",\"operateTime\":\"2020-12-23 11:02:45\",\"memo\":\"\",\"rqCode\":null,\"userId\":\"\",\"loginCount\":0,\"lastLoginIp\":\" \",\"lastLoginTime\":\" \",\"password\":\"111111\",\"recommenderId\":null,\"psChangeTime\":\"\",\"integral\":null,\"name\":\"贷款资料录入环节接口\",\"billStatus\":\"1\",\"region\":\"324\",\"operatorId\":\"admin\",\"recommender\":\"19793083332\",\"account\":\"18695062221\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 11:03:42', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d90dc01768d9102620001', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 11:07:39', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d90dc01768d91fa410003', NULL, 'admin', '/user/edit', '新增', '用户管理>>用户管理>>新增：返回结果：public/close-layer，数据：{\"role\":RoleVO(roleId=40288598768a4cb401768a4db5570004, roleName=null, roleType=null, operateTime=null, operatorId=null, billStatus=null, memo=null, roleModule=[]),\"org\":1,\"isDelete\":\"0\",\"sex\":\"1\",\"operateTime\":\"2020-12-23 11:08:18\",\"memo\":\"asd\",\"rqCode\":null,\"userId\":\"40288598768d90dc01768d91de8a0002\",\"loginCount\":0,\"lastLoginIp\":\" \",\"lastLoginTime\":\" \",\"password\":\"dogefiiognjigdog\",\"recommenderId\":null,\"psChangeTime\":\"\",\"integral\":null,\"name\":\"好\",\"billStatus\":\"1\",\"region\":\"324\",\"operatorId\":\"admin\",\"recommender\":\"19793083332\",\"account\":\"18695062221\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 11:08:42', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d90dc01768d93c8000005', NULL, 'admin', '/user/edit', '新增', '用户管理>>用户管理>>新增：返回结果：public/close-layer，数据：{\"role\":RoleVO(roleId=40288598768a4cb401768a4db5570004, roleName=null, roleType=null, operateTime=null, operatorId=null, billStatus=null, memo=null, roleModule=[]),\"org\":1,\"isDelete\":\"0\",\"sex\":\"1\",\"operateTime\":\"2020-12-23 11:09:44\",\"memo\":\"as\",\"rqCode\":null,\"userId\":\"40288598768d90dc01768d93c7a50004\",\"loginCount\":0,\"lastLoginIp\":\" \",\"lastLoginTime\":\" \",\"password\":\"pnliiidgkneicjmb\",\"recommenderId\":null,\"psChangeTime\":\"\",\"integral\":null,\"name\":\"总部\",\"billStatus\":\"1\",\"region\":\"业务额\",\"operatorId\":\"admin\",\"recommender\":\"19793083332\",\"account\":\"18695062220\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 11:10:41', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d98c601768d9e9ce80001', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 11:22:30', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d98c601768d9fd0d00002', NULL, 'admin', '/user/edit', '新增', '用户管理>>用户管理>>新增：errorMsg：该推荐人不是分分销商角色！，数据：{\"role\":RoleVO(roleId=40288598768a4cb401768a4db5570004, roleName=null, roleType=null, operateTime=null, operatorId=null, billStatus=null, memo=null, roleModule=[]),\"org\":1,\"isDelete\":\"0\",\"sex\":\"1\",\"operateTime\":\"2020-12-23 11:23:15\",\"memo\":\"水电费\",\"rqCode\":null,\"userId\":\"\",\"loginCount\":0,\"lastLoginIp\":\" \",\"lastLoginTime\":\" \",\"password\":\"111111\",\"recommenderId\":null,\"psChangeTime\":\"\",\"integral\":null,\"name\":\"zhang满分\",\"billStatus\":\"1\",\"region\":\"阿萨德\",\"operatorId\":\"admin\",\"recommender\":\"19793083332\",\"account\":\"18695062225\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 11:23:49', NULL);
INSERT INTO `sys_log` VALUES ('40288598768d98c601768da09b270004', NULL, 'admin', '/user/edit', '新增', '用户管理>>用户管理>>新增：返回结果：public/close-layer，数据：{\"role\":RoleVO(roleId=40288598768a4cb401768a4db5570004, roleName=null, roleType=null, operateTime=null, operatorId=null, billStatus=null, memo=null, roleModule=[]),\"org\":1,\"isDelete\":\"0\",\"sex\":\"1\",\"operateTime\":\"2020-12-23 11:24:09\",\"memo\":\"水电费\",\"rqCode\":null,\"userId\":\"40288598768d98c601768da09ac60003\",\"loginCount\":0,\"lastLoginIp\":\" \",\"lastLoginTime\":\" \",\"password\":\"pnliiidgkneicjmb\",\"recommenderId\":\"40288598768a4cb401768a4f7d280009\",\"psChangeTime\":\"\",\"integral\":null,\"name\":\"zhang满分\",\"billStatus\":\"1\",\"region\":\"阿萨德\",\"operatorId\":\"admin\",\"recommender\":\"文件(18694063332)\",\"account\":\"18695062225\"}', '0:0:0:0:0:0:0:1', '1', '2020-12-23 11:24:41', NULL);
INSERT INTO `sys_log` VALUES ('ff808081768a545201768a54e6ac0001', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '124.160.84.198', '1', '2020-12-22 20:03:08', NULL);
INSERT INTO `sys_log` VALUES ('ff808081768a545201768d212aa00002', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '124.160.84.198', '1', '2020-12-23 09:05:29', NULL);
INSERT INTO `sys_log` VALUES ('ff808081768a545201768d216e5c0003', NULL, 'admin', '/toLogin', '登陆', '登陆：返回结果：{status=true, errorMsg=}', '124.160.84.198', '1', '2020-12-23 09:05:47', NULL);

-- ----------------------------
-- Table structure for sys_memorandum
-- ----------------------------
DROP TABLE IF EXISTS `sys_memorandum`;
CREATE TABLE `sys_memorandum`  (
  `memorandumId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '备忘签内容',
  `isDelete` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除 1-是 0-否',
  `operateTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作时间',
  `operatorId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  PRIMARY KEY (`memorandumId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '备忘笺' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org`  (
  `orgId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `fullname` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全称',
  `seq` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序列号',
  `orgFSeq` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属父seq',
  `isDelete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否删除',
  `operateTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作时间',
  `operatorId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `billStatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否可用',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`orgId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('1', '1', '管理部', '管理部', '1.', '', '', '2018-11-19 14:27:56', 'admin', '1', '1');
INSERT INTO `sys_org` VALUES ('4028803a65c7dffd0165c7e0c39c0001', '4', '二级部门', '二级部门', '1.4.', '1.', '', '2018-09-11 17:05:20', 'admin', '1', '');
INSERT INTO `sys_org` VALUES ('4028803a65e549160165e5492dfb0000', '5', '三级部门', '三级部门', '1.4.5.', '1.4.', '', '2018-09-17 10:08:23', 'admin', '1', '');
INSERT INTO `sys_org` VALUES ('4028803a65e549160165e549d6c00002', '6', '三级部门2', '三级部门2', '1.4.6.', '1.4.', '', '2018-09-17 10:09:06', 'admin', '1', '');
INSERT INTO `sys_org` VALUES ('4028803a65e549160165e581178f0004', '7', '四级部门', '四级部门', '1.4.5.7.', '1.4.5.', '', '2018-09-17 11:09:27', 'admin', '1', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `roleId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `roleName` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `roleType` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '1全局型角色、2应用级角色',
  `operateTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作时间',
  `operatorId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人',
  `billStatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态 1正常 0禁用',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('0', '超级管理员', '1', '2018-09-11 16:38:25', 'admin', '1', NULL);
INSERT INTO `sys_role` VALUES ('40288598768a4cb401768a4d99100002', '分销商', '2', '2020-12-22 19:55:09', 'admin', '1', '');
INSERT INTO `sys_role` VALUES ('40288598768a4cb401768a4db5570004', '水电工', '2', '2020-12-22 19:55:17', 'admin', '1', '');
INSERT INTO `sys_role` VALUES ('40288598768a4cb401768a4de52c0006', '项目经理', '2', '2020-12-22 19:55:29', 'admin', '1', '');

-- ----------------------------
-- Table structure for sys_role_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_module`;
CREATE TABLE `sys_role_module`  (
  `roleModuleId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `roleId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `moduleMenu1` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '一级菜单名字',
  `moduleMenu2` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '二级菜单名字',
  `modulePage` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '页面名字',
  `moduleButton` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题名字',
  `billStatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态 1正常 0禁用',
  PRIMARY KEY (`roleModuleId`) USING BTREE,
  INDEX `sys_role_module_ibfk_1`(`roleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`  (
  `taskId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `className` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '包名+类名',
  `cron` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'cron表达式',
  `initialDelay` int(32) DEFAULT NULL COMMENT '延迟执行 单位秒',
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `serverIp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务器ip',
  `billStatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '调度开关，详见数据词典',
  `isDynamic` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否可修改 1-是 0-否',
  `isEdited` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否已经在界面中编辑过',
  PRIMARY KEY (`taskId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统调度任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES ('40288598768d98c601768d98dd730000', 'com.jadmin.quartz.HelloJob', '', 0, '', '192.168.5.24', '0', '1', '0');
INSERT INTO `sys_task` VALUES ('ff808081768a545201768a5474110000', 'com.jadmin.quartz.HelloJob', '', 0, '', '127.0.0.1', '0', '1', '0');

-- ----------------------------
-- Table structure for sys_task_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_log`;
CREATE TABLE `sys_task_log`  (
  `logId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `className` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '包名+类名',
  `serverIp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务器ip',
  `content` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `startTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开始时间',
  `endTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结束时间',
  `executeTime` int(11) NOT NULL COMMENT '耗时 单位为秒',
  PRIMARY KEY (`logId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度任务执行记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `userId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `orgId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属机构',
  `roleId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属角色',
  `account` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `lastLoginIp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上次登录ip',
  `lastLoginTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上次登录时间',
  `loginCount` int(10) NOT NULL DEFAULT 0 COMMENT '登录次数',
  `psChangeTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码修改时间',
  `isDelete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operateTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作时间',
  `operatorId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `billStatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否可用',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `integral` int(10) DEFAULT NULL COMMENT '积分',
  `recommender` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '推荐人',
  `recommenderId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '推荐人id',
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区域',
  `rqCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE,
  INDEX `FKii60dd8hajdmbm0uvkkporcbl`(`orgId`) USING BTREE,
  INDEX `FK9s2sqg6p1req126agyn1sfeiy`(`roleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('402881ee4ff9acb3014ff11161111004', '1', '0', 'admin', '系统管理员', 'pnliiidgkneicjmb', '1', '0:0:0:0:0:0:0:1', '2020-12-23 11:22:31', 17, '2018-11-21 09:27:52', '0', '2018-11-21 08:21:34', 'admin', '1', '描述', 1, '推荐人', NULL, '区域', '二维码');
INSERT INTO `sys_user` VALUES ('40288598768a452601768a4895700002', '4028803a65e549160165e549d6c00002', '0', '19793083332', '张三', 'pnliiidgkneicjmb', '1', ' ', ' ', 0, '', '0', '2020-12-22 19:49:41', 'admin', '1', '水电费', 1, '瑜伽疼', NULL, '阿萨德', '但是');
INSERT INTO `sys_user` VALUES ('40288598768a4cb401768a4f7d280009', '4028803a65c7dffd0165c7e0c39c0001', '40288598768a4cb401768a4d99100002', '18694063332', '文件', 'pnliiidgkneicjmb', '1', ' ', ' ', 0, '', '0', '2020-12-22 19:57:13', 'admin', '1', '', NULL, '瑜伽疼', NULL, '阿萨德', NULL);
INSERT INTO `sys_user` VALUES ('40288598768d90dc01768d91de8a0002', '1', '40288598768a4cb401768a4db5570004', '18695062221', '好', 'dogefiiognjigdog', '1', ' ', ' ', 0, '', '0', '2020-12-23 11:08:18', 'admin', '1', 'asd', NULL, '19793083332', NULL, '324', NULL);
INSERT INTO `sys_user` VALUES ('40288598768d90dc01768d93c7a50004', '1', '40288598768a4cb401768a4db5570004', '18695062220', '总部', 'pnliiidgkneicjmb', '1', ' ', ' ', 0, '', '0', '2020-12-23 11:09:44', 'admin', '1', 'as', NULL, '19793083332', NULL, '业务额', NULL);
INSERT INTO `sys_user` VALUES ('40288598768d98c601768da09ac60003', '1', '40288598768a4cb401768a4db5570004', '18695062225', 'zhang满分', 'pnliiidgkneicjmb', '1', ' ', ' ', 0, '', '0', '2020-12-23 11:24:09', 'admin', '1', '水电费', NULL, '文件(18694063332)', '40288598768a4cb401768a4f7d280009', '阿萨德', NULL);

-- ----------------------------
-- Table structure for sys_user2
-- ----------------------------
DROP TABLE IF EXISTS `sys_user2`;
CREATE TABLE `sys_user2`  (
  `userId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `orgId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属机构',
  `roleId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属角色',
  `account` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名字',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `lastLoginIp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上次登录ip',
  `lastLoginTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上次登录时间',
  `loginCount` int(10) NOT NULL DEFAULT 0 COMMENT '登录次数',
  `psChangeTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码修改时间',
  `isDelete` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operateTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作时间',
  `operatorId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `billStatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否可用',
  `memo` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`userId`) USING BTREE,
  INDEX `FKii60dd8hajdmbm0uvkkporcbl`(`orgId`) USING BTREE,
  INDEX `FK9s2sqg6p1req126agyn1sfeiy`(`roleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user2
-- ----------------------------
INSERT INTO `sys_user2` VALUES ('402881ee4ff9acb3014ff11161111004', '1', '0', 'admin', '系统管理员', 'pnliiidgkneicjmb', '1', '0:0:0:0:0:0:0:1', '2020-12-22 18:39:33', 4, '2018-11-21 09:27:52', '0', '2018-11-21 08:21:34', 'admin', '1', '');

SET FOREIGN_KEY_CHECKS = 1;
