package com.jadmin.controller.admin;

import com.jadmin.modules.annotation.NoNeedLogin;
import com.jadmin.modules.controller.base.BaseAbstractController;
import com.jadmin.util.WeChatUtil;
import com.jadmin.vo.entity.WeChatVO.ArticlesItem;
import com.jadmin.vo.entity.WeChatVO.WeChatInMsgDTO;
import com.jadmin.vo.entity.WeChatVO.WeChatOutMsgDTO;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;

/**
 * @Description: java类作用描述
 * @Author: dongzhou
 * @CreateDate: 2020/12/24 11:51
 */
@Controller
public class WeChatController  extends BaseAbstractController {

    @RequestMapping(value = "/wechat",method = RequestMethod.GET)
    @ResponseBody
    @NoNeedLogin
    public String checkWechatToken(String signature,String timestamp,String nonce,String echostr){
        String[] arr={WeChatUtil.TOKEN,timestamp,nonce};
        Arrays.sort(arr);
        StringBuffer sb=new StringBuffer();
        for(String str:arr){
            sb.append(str);
        }
        String mysignature=  DigestUtils.sha1Hex(sb.toString());
        if(signature.equals(mysignature)){
            return echostr;
        }
        return null;
    }

    @RequestMapping(value = "wechat",method = RequestMethod.POST)
    @ResponseBody
    public Object handelMssage(@RequestBody WeChatInMsgDTO weChatInMsgDTO){
        WeChatOutMsgDTO out =new WeChatOutMsgDTO();
        //发送方
        out.setFromUserName(weChatInMsgDTO.getToUserName());
        //接收方
        out.setToUserName(weChatInMsgDTO.getFromUserName());
        //创建时间
        out.setCreateTime(System.currentTimeMillis());
        if(weChatInMsgDTO.getMsgType().equals("text")){
            if(weChatInMsgDTO.getContent().contains("你在想什么了")){
                out.setContent("我在想你啊");
            }else{
                //恢复消息类型
                out.setMsgType(weChatInMsgDTO.getMsgType());
                out.setContent(weChatInMsgDTO.getContent());
            }

        }else if(weChatInMsgDTO.getMsgType().equals("image")){
            out.setMsgType(weChatInMsgDTO.getMsgType());

            out.setMediaId(new String[]{weChatInMsgDTO.getMediaId()});
        }else if(weChatInMsgDTO.getMsgType().equals("event")){
            if(weChatInMsgDTO.getEvent().equals("subscribe")){
                out.setMsgType("news");

                ArticlesItem item=new ArticlesItem();
                item.setTitle("你是xxx？？");
                item.setPicUrl("https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png");
                item.setDescription("有困难找警察，有问题找度娘！关注百度不迷路");
                item.setUrl("https://www.baidu.com/");
                out.setItem(new ArticlesItem[]{item} );
                out.setArticleCount(out.getItem().length);
            }else if(weChatInMsgDTO.getEvent().equals("subscribe")){
                out.setMsgType("text");
                out.setContent("走好不送！");
            }
        }
        return WeChatUtil.obj2XML(out);
    }
}
