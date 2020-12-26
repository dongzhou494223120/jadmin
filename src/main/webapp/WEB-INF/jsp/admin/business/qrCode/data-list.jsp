<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/HTML" prefix="html" %>
<!DOCTYPE HTML>
<html>
<head>
    <c:if test="${!empty refreshTime}">
        <meta http-equiv="refresh" content="${refreshTime }">
    </c:if>
    <jsp:include page="../../part/head.jsp"/>
    <title>${pageName[1] }</title>
</head>
<body>
34534565

<div class="pd-20" style="padding-top: 0px;">
    <form action="/dictkind/edit?nrTab=" method="post" class="form form-horizontal validform" enctype="multipart/form-data" id="form-add">
        <div class="row cl" style="margin-top: 0px;">
            <label class="form-label col-5"><span class="c-red"></span></label>
        </div>
        <div class="row cl editDiv ed_100 ed_100_left">
            <label class="form-label col-xs-4 col-sm-3-msun"><span class="c-red">*</span>字典属性类别：</label>
            <div class="formControls col-xs-5 col-sm-7" style="padding-left:0px;">
                <span class="sod_select" tabindex="0" data-cycle="false" data-links="false" data-links-external="false" data-placeholder-option="false" data-filter="" style="width: 122px;">
                    <span class="sod_label">请选择</span><span class="sod_list_wrapper"><span class="sod_list"><span class="sod_option  selected active " title="请选择" data-value="">请选择</span><span class="sod_option " title="人工添加" data-value="0">人工添加</span><span class="sod_option " title="动态获取" data-value="1">动态获取</span></span></span>
                    <select id="isDynamic" name="isDynamic" class="select" datatype="*1-1024" nullmsg="请选择字典属性类别">
                        <option value="" selected="selected">请选择</option>
                        <option value="0">人工添加</option>
                        <option value="1">动态获取</option></select></span>
                <span></span>
            </div>
            <div></div>
        </div>

        <div class="row cl editDiv ed_100 ed_100_left">
            <label class="form-label col-xs-4 col-sm-3-msun"><span class="c-red">*</span>名称：</label>
            <div class="formControls col-xs-5 col-sm-7" style="padding-left:0px;">
                <input type="text" class="input-text" id="name" value="" name="name" datatype="*1-1024" placeholder="" nullmsg="名称不能为空" />
            </div>
            <div></div>
        </div>
        <div class="row cl editDiv ed_100 ed_100_left">
            <label class="form-label col-xs-4 col-sm-3-msun"><span class="c-red">*</span>编号：</label>
            <div class="formControls col-xs-5 col-sm-7" style="padding-left:0px;">
                <input type="text" class="input-text" id="code" value="" name="code" datatype="*1-1024" placeholder="" nullmsg="编号不能为空" />
            </div>
            <div></div>
        </div>
        <div class="row cl editDiv ed_100 ed_100_left">
            <label class="form-label col-xs-4 col-sm-3-msun"><span class="c-red">*</span>字典属性类别：</label>
            <div class="formControls col-xs-5 col-sm-7" style="padding-left:0px;">
                <span class="sod_select" tabindex="0" data-cycle="false" data-links="false" data-links-external="false" data-placeholder-option="false" data-filter="" style="width: 122px;"><span class="sod_label">请选择</span><span class="sod_list_wrapper"><span class="sod_list"><span class="sod_option  selected active " title="请选择" data-value="">请选择</span><span class="sod_option " title="人工添加" data-value="0">人工添加</span><span class="sod_option " title="动态获取" data-value="1">动态获取</span></span></span><select id="isDynamic" name="isDynamic" class="select" datatype="*1-1024" nullmsg="请选择字典属性类别"><option value="" selected="selected">请选择</option><option value="0">人工添加</option><option value="1">动态获取</option></select></span>
                <span></span>
            </div>
            <div></div>
        </div>
        <div class="row cl editDiv ed_100 ed_100_left">
            <label class="form-label col-xs-4 col-sm-3-msun">sql：</label>
            <div class="formControls col-xs-5 col-sm-7" style="padding-left:0px;">
                <input type="text" class="input-text" id="dynSql" value="" name="dynSql" placeholder="" nullmsg="" />
            </div>
            <div></div>
        </div>
        <div class="row cl editDiv ed_100 ed_100_left">
            <label class="form-label col-xs-4 col-sm-3-msun"><span class="c-red">*</span>类型：</label>
            <div class="formControls col-xs-5 col-sm-7" style="padding-left:0px;">
                <div class="skin-minimal" style="padding-top: 3px;">
                    <div class="radio-box">
                        <div class="iradio-blue">
                            <input type="radio" id="radio-1006" name="type" value="1" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;" />
                            <ins style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                        </div>
                        <label for="radio-1006">单选</label>
                    </div>
                    <div class="radio-box">
                        <div class="iradio-blue">
                            <input datatype="*" type="radio" id="radio-1007" name="type" value="2" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;" />
                            <ins style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                        </div>
                        <label for="radio-1007">多选</label>
                    </div>
                </div>
            </div>
            <div></div>
        </div>
        <div class="row cl editDiv ed_100 ed_100_left">
            <label class="form-label col-xs-4 col-sm-3-msun"><span class="c-red">*</span>状态：</label>
            <div class="formControls col-xs-5 col-sm-7" style="padding-left:0px;">
                <span class="sod_select " tabindex="0" data-cycle="false" data-links="false" data-links-external="false" data-placeholder-option="false" data-filter=""><span class="sod_label">请选择</span><span class="sod_list_wrapper"><span class="sod_list"><span class="sod_option  selected active " title="请选择" data-value="">请选择</span><span class="sod_option " title="启用" data-value="1">启用</span><span class="sod_option " title="停用" data-value="0">停用</span><span class="sod_option " title="待审核" data-value="2">待审核</span></span></span><select id="billStatus" name="billStatus" class="select" datatype="*1-1024" nullmsg="请选择状态"><option value="" selected="selected">请选择</option><option value="1">启用</option><option value="0">停用</option><option value="2">待审核</option></select></span>
                <span></span>
            </div>
            <div></div>
        </div>
        <div class="row cl editDiv ed_100 ed_100_left">
            <label class="form-label col-xs-4 col-sm-3-msun">描述：</label>
            <div class="formControls col-xs-5 col-sm-7" style="padding-left:0px;">
                <textarea name="memo" cols="" rows="" class="textarea" id="memo" onkeyup="textarealength(this,512)" maxlength="512"></textarea>
                <p class="textarea-numberbar"> <em class="textarea-length"> 0 </em>/512 </p>
            </div>
            <div></div>
        </div>
        <div class="row cl editDiv ed_100">
            <div style="margin-left: 12.5%; margin-bottom: 20px;">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" />
            </div>
        </div>
    </form>
</div>
<%--<c:if test="${param.hideAll != 'true' && param.hideTitle != 'true'}">--%>
<%--<jsp:include page="../../part/data-title.jsp"/>--%>
<%--</c:if>--%>
<%--<div class="pd-20">--%>
<%--<div class="">--%>
<%--<c:if test="${param.hideAll != 'true'}">--%>
<%--<jsp:include page="../../part/data-list-search.jsp"/>--%>
<%--<div class="cl pd-5 bg-1 bk-gray mt-20">--%>
<%--<span class="l" id="a_warp">--%>
<%--<c:forEach items="${pageButtons}" var="pageButton">--%>
<%--<c:if test="${pageButton.name != '详情'}">--%>
<%--<a href="${pageButton.href}" class="btn ${pageButton.color} radius">--%>
<%--<i class="Hui-iconfont">${pageButton.imgChar}</i> ${pageButton.name}--%>
<%--</a>--%>
<%--</c:if>--%>
<%--</c:forEach>--%>
<%--</span>--%>
<%----%>
<%--<span class="r" style="padding-top: 3px; margin-right: 8px; margin-left: 9px;" id="downLoad">--%>
<%--<i class="Hui-iconfont">&#xe640;</i>--%>
<%--</span>--%>
<%----%>
<%--<c:if test="${!empty orderByColumns}">--%>
<%--<li class="dropDown dropDown_hover r" style="padding-top: 5px;">--%>
<%--<a href="#" class="dropDown_A">--%>
<%--<c:if test="${empty param.orderByName}">--%>
<%--排序--%>
<%--</c:if>--%>
<%--<c:if test="${!empty param.orderByName}">--%>
<%--${param.orderByName }--%>
<%--</c:if>--%>
<%--<i class="Hui-iconfont"></i></a>--%>
<%--<ul class="dropDown-menu radius box-shadow dropDown-desc" style="left: auto; right: -5px;">--%>
<%--<li><a href="javascript:orderBySub('', '排序');">默认顺序</a></li>--%>
<%--<c:forEach items="${orderByColumns}" var="col">--%>
<%--<c:if test="${col.orderBy==0 || col.orderBy==1}">--%>
<%--<li><a href="javascript:orderBySub('${col.column }', '${col.name }正序');">${col.name }正序</a></li>--%>
<%--</c:if>--%>
<%--<c:if test="${col.orderBy==0 || col.orderBy==2}">--%>
<%--<li><a href="javascript:orderBySub('${col.column } desc', '${col.name }倒序');">${col.name }倒序</a></li>--%>
<%--</c:if>--%>
<%--</c:forEach>--%>
<%--</ul>--%>
<%--</li>--%>
<%--</c:if>--%>
<%----%>
<%--<span class="r" style="margin-top: 5px; margin-right: 10px;">--%>
<%--<select name="DataTables_Table_0_length" id="pageSizeSe" aria-controls="DataTables_Table_0" class="select defalut">--%>
<%--<option value="${DEF_PAGESIZE}">${DEF_PAGESIZE}条</option>--%>
<%--<option value="50">50条</option>--%>
<%--<option value="100">100条</option>--%>
<%--<option value="500">500条</option>--%>
<%--<option value="1000">1000条</option>--%>
<%--</select>--%>
<%--</span>--%>
<%----%>
<%--<span class="r" style="padding-top: 5px; margin-right: 10px">共有数据：<strong>${page.totalCount}</strong> 条 </span>--%>
<%--</div>--%>
<%--</c:if>--%>
<%----%>
<%--<div class="<c:if test="${param.hideAll != 'true'}">mt-20</c:if>">--%>
<%--<table--%>
<%--class="table table-border table-bordered table-hover table-bg table-sort">--%>
<%--<thead>--%>
<%--<tr class="text-c">--%>
<%--<c:if test="${fn:length(pageButtons) > 1 || (fn:length(pageButtons) == 1 && pageButtons[0].name != '详情')}">--%>
<%--<th width="30"><input type="checkbox"></th>--%>
<%--</c:if>--%>
<%--<c:forEach items="${tableColumns}" var="tabCol">--%>
<%--<th>${tabCol.name }</th>--%>
<%--</c:forEach>--%>
<%--</tr>--%>
<%--</thead>--%>
<%--<tbody>--%>
<%--<c:choose>--%>
<%--<c:when test="${empty page.result }">--%>
<%--<tr class="text-c">--%>
<%--<td colspan="100">${msg }</td>--%>
<%--</tr>--%>
<%--</c:when>--%>
<%--<c:otherwise>--%>
<%--<c:forEach items="${page.result}" var="data">--%>
<%--<tr class="text-c">--%>
<%--<c:if test="${fn:length(pageButtons) > 1 || (fn:length(pageButtons) == 1 && pageButtons[0].name != '详情')}">--%>
<%--<td><input type="checkbox" value="${data.primaryKey }" name="id", id="checkbox_${data.primaryKey }"></td>--%>
<%--</c:if>--%>
<%--<c:forEach items="${tableColumns}" var="tabCol" varStatus="status">--%>
<%--<td>--%>
<%--<c:if test="${status.first && oneUrl != ''}">--%>
<%--<a style="text-decoration: underline;" href="javascript:msunCommonToEdit('${baseUrl }${oneUrl }', '${data.primaryKey }', '2');" class="">--%>
<%--</c:if>--%>
<%--<html:getValue vo="${data }" attribute="${tabCol.column }" videoAttribute = "${tabCol.videoPath }"--%>
<%--selectCode="${tabCol.selectCode }" maxLength = "${tabCol.maxLength }" isImg = "${tabCol.img }"></html:getValue>--%>
<%--<c:if test="${status.first && oneUrl != ''}">--%>
<%--</a>--%>
<%--</c:if> --%>
<%--</td>--%>
<%--</c:forEach>--%>
<%--</tr>--%>
<%--</c:forEach>--%>
<%--</c:otherwise>--%>
<%--</c:choose>--%>
<%--</tbody>--%>
<%--</table>--%>
<%--<c:if test="${param.hideAll != 'true'}">--%>
<%--<jsp:include page="../../part/page.jsp"/>--%>
<%--</c:if>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%----%>
<%--<div class="carrousel" style="display: none;"> <span class="entypo-cancel">×</span> --%>
<%--<div class="wrapper"> <img src="" alt="" class="img_video"/> <video  autoplay="autoplay" style="padding-top: 20px; max-height: calc(100% - 40px);" class="img_video" src="" controls="controls"> 您的浏览器不支持 video 标签。</video> </div>--%>
<%--</div>--%>
</body>

<%--<script type="text/javascript" src="/admin/public/js/data-list.js"></script>--%>
<%--<c:if test="${jsListFile != null && jsListFile != '' }">--%>
<%--<script type="text/javascript" src="${jsListFile }"></script>--%>
<%--</c:if>--%>

<%--</html>--%>