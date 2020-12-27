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

<form class="form">
<div class="row cl editDiv ed_100 ed_100_left" id="category">
    <label class="form-label col-xs-4 col-sm-3-msun">
        <span class="c-red">*</span>系列：</label>
    <div class="formControls col-xs-5 col-sm-7" style="padding-left:0px;">
        <select  name="category" class="select" datatype="*1-1024" nullmsg="请选择系列">
        <option>请选择系列</option>
        </select>
        <span></span>
    </div>
    <div></div>
</div>

    <div class="row cl editDiv ed_100 ed_100_left " id="references">
        <label class="form-label col-xs-4 col-sm-3-msun">
            <span class="c-red">*</span>分销商：</label>
        <div class="formControls col-xs-5 col-sm-7" style="padding-left:0px;">
            <select  name="references" datatype="*1-1024" nullmsg="请选择分销商">
                <option>请选择分销商</option>
            </select>
            <span></span>
        </div>
        <div></div>
    </div>
    <div class="row cl editDiv ed_100 ed_100_left">
        <label class="form-label col-xs-4 col-sm-3-msun">
            <span class="c-red">*</span>积分：</label>
        <div class="formControls col-xs-5 col-sm-7" style="padding-left:0px;">
            <input type="text" class="input-text" id="integral" value="" name="integral" datatype="*1-1024" placeholder="" nullmsg="名称不能为空"></div>
        <div></div>
    </div>

<div class="row cl editDiv ed_100 ed_100_left">
    <label class="form-label col-xs-4 col-sm-3-msun">描述：</label>
    <div class="formControls col-xs-5 col-sm-7" style="padding-left:0px;">
        <textarea name="ms" cols="" rows="" class="textarea" id="ms" onKeyUp="textarealength(this,512)" maxlength="512"></textarea>
        <p class="textarea-numberbar">
            <em class="textarea-length">0</em>/512</p></div>
    <div></div>
</div>
    <div class="row cl editDiv ed_100 ed_100_left">
        <label class="form-label col-xs-4 col-sm-3-msun">
            <span class="c-red">*</span>数量：</label>
        <div class="formControls col-xs-5 col-sm-7" style="padding-left:0px;">
            <input type="text" class="input-text" id="count" value="" name="count" datatype="*1-1024" placeholder="" nullmsg="名称不能为空"></div>
        <div></div>
    </div>

<div class="row cl editDiv ed_100">
    <div style="margin-left: 12.5%; margin-bottom: 20px;">
        <input class="btn btn-primary radius " qr_type="1" type="button" value="下载普通二维码">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input class="btn btn-primary radius"  qr_type="2" type="button" value="下载带背景二维码">
    </div>

</div>
</form>
</body>
<script>
    $(function(){
        $.ajax({
            url: "/getDictionaries",
            type: 'get',
            dataType: 'json',
            contentType: "application/json",
            data: {
            },
            success: function (data, status) {
                var CATEGORY=data.CATEGORY;
                var REFERENCES =data.REFERENCES;

                var html_category='<option value="" selected="selected">请选择系列</option>';
                var span_category='<span class="sod_option  selected active " title="请选择系列" data-value="">请选择系列</span>';
                for (i in CATEGORY){
                    html_category+='  <option value="'+CATEGORY[i].dictinfoId+'">'+CATEGORY[i].name+'</option>';
                    span_category+='<span class="sod_option" title="'+CATEGORY[i].name+'" data-value="'+CATEGORY[i].dictinfoId+'">'+CATEGORY[i].name+'</span>'

                }

                $("#category").find("select").html(html_category)
                $("#category").find(".sod_list").html(span_category)
                var html_references='<option value="" selected="selected">请选择分销商</option>';
                var span_references='<span class="sod_option  selected active " title="请选择分销商" data-value="">请选择分销商</span>';
                for (i in REFERENCES){
                    html_references+='  <option value="'+REFERENCES[i].dictinfoId+'">'+REFERENCES[i].name+'</option>';
                    span_references+='<span class="sod_option" title="'+REFERENCES[i].name+'" data-value="'+REFERENCES[i].dictinfoId+'">'+REFERENCES[i].name+'</span>'
                }
                $("#references").find("select").html(html_references)
                $("#references").find(".sod_list").html(span_references)

            }
        })

        $("form").find("input[type='button']").click(function () {

            var category=$("#category").find("select option:selected").val();
            var references=$("#references").find("select option:selected").val();
            var integral=parseInt($("#integral").val());
            var ms=$("#ms").val();
            var count=parseInt($("#count").val());
            var qr_type =1
            if ($(this).attr("qr_type")==2){
                qr_type=2
            }
            if (category.length<1){
                layer.alert("请选择系列");
                return
            }
            if(references.length<1){
                layer.alert("请选择分销商");
                return
            }
            console.log(integral)
            if (isNaN(integral) ||integral<1 ){
                layer.alert("积分必须大于0");
                return
            }
            if (isNaN(count) ||integral<1 ){
                layer.alert("数量必须大于0");
                return
            }
           var  loding_index=layer.msg('二维码生成中，请稍后......', {
                icon: 16
                ,shade: 0.01
            });
            $.ajax({
                url: "/qrCode/downloadQRcode",
                type: 'post',
                dataType: 'json',
                data: {
                    roleId:references,
                    seriesId:category,
                    integral:integral,
                    count:count,
                    ms:ms,
                    qr_type:qr_type
                },
                success: function (data, status) {
                    layer.close(loding_index)
                    if (data.error>0){
                        layer.alert(data.message);
                        return
                    }else{
                        layer.alert(data.message,function () {
                            location.href=data.link;
                        });


                        return
                    }

                }
            })
        })

    })
</script>