package com.jadmin.util;

import com.alibaba.fastjson.JSON;
import com.jadmin.util.conn.HttpUtil;
import com.jadmin.vo.entity.WeChatVO.WeChatResultDTO;
import com.jadmin.vo.entity.WeChatVO.menu.ButtonVO;
import com.jadmin.vo.entity.WeChatVO.menu.WeChatMenuVO;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description: java类作用描述
 * @Author: dongzhou
 * @CreateDate: 2020/12/24 11:53
 */
public class WeChatUtil {
    public static final String TOKEN = "dzh494223120";
    public static final String appID = "wxecd89deb9f7c4e1b";
    public static final String appsecret = "ab767f2d9febbc6d74a7d09df6f00a3a";

    public static final String CREATE_MENU = " https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
    //接口有效凭证
    public static String accessToken;
    public static Long expiresTime;
    public static final String ACCESS_TOKEN = " https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";


    public static String obj2XML(Object obj) {
        StringWriter sw = new StringWriter();
        String xml = null;
        try {
            // 利用jdk中自带的转换类实现
            JAXBContext context = JAXBContext.newInstance(obj.getClass());

            Marshaller marshaller = context.createMarshaller();
            // 格式化xml输出的格式
//                     marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT,Boolean.TRUE);
//                     marshaller.setProperty(Marshaller.JAXB_FRAGMENT, Boolean.FALSE);
//                     marshaller.setProperty(Marshaller.JAXB_ENCODING, "gb2312");
            // 将对象转换成输出流形式的xml
            marshaller.marshal(obj, sw);
            xml = sw.toString();
        } catch (JAXBException e) {
            e.printStackTrace();
        }
        return xml;
    }


    /**
     * 获取token
     *
     * @return
     */
    public static String getAccessToken() {
        if (null == accessToken || System.currentTimeMillis() > expiresTime) {
            WeChatResultDTO dto = HttpUtil.sendGet(ACCESS_TOKEN.replace("APPID", appID).replace("APPSECRET", appsecret));
            if (null != dto.getAccess_token()) {
                expiresTime = System.currentTimeMillis() + ((dto.getExpires_in() - 60) * 1000);
                accessToken = dto.getAccess_token();
                return accessToken;
            }

        }
        return null;
    }

    public static String createMenu(String accessTokena) {
//        String meu = "{\n" +
//                "     \"button\":[\n" +
//                "     {\t\n" +
//                "          \"type\":\"view\",\n" +
//                "          \"name\":\"产品\",\n" +
//                "    \"url\":\"http://www.wawechat.siemens.com.cn/Home/Product/ssy_product\",\n" +
//                "          \"key\":\"V1001_TODAY_MUSIC\"\n" +
//                "\n" +
//                "      },\n" +
//                "   {\t\n" +
//                "          \"type\":\"view\",\n" +
//                "          \"name\":\"汇迈电器\",\n" +
//                "   \"url\":\"http://www.wawechat.siemens.com.cn/Home/Product/ssy_product\",\n" +
//                "          \"key\":\"V1002_TODAY_MUSIC\"\n" +
//                "      },\n" +
//                "      {\n" +
//                "           \"name\":\"我\",\n" +
//                "           \"sub_button\":[\n" +
//                "           {\t\n" +
//                "               \"type\":\"view\",\n" +
//                "               \"name\":\"用户中心\",\n" +
//                "                \"url\":\"http://www.wawechat.siemens.com.cn/Home/Product/ssy_product\"\n" +
//                "            },\n" +
//                "            {\n" +
//                "                 \"type\":\"view\",\n" +
//                "                 \"name\":\"二维码\",\n" +
//                "                 \"url\":\"http://www.wawechat.siemens.com.cn/Home/Product/ssy_product\"\n" +
//                "         \n" +
//                "             },\n" +
//                "            {\n" +
//                "               \"type\":\"click\",\n" +
//                "               \"name\":\"关于我们\",\n" +
//                "   \"url\":\"http://www.wawechat.siemens.com.cn/Home/Product/ssy_product\",\n" +
//                "               \"key\":\"V1001_GOOD\"\n" +
//                "            }]\n" +
//                "       }]\n" +
//                " }";

        WeChatMenuVO vo = new WeChatMenuVO();

        List<ButtonVO> btn = new ArrayList<>();
        ButtonVO vo1 = new ButtonVO();
        vo1.setName("产品");
        vo1.setType("view");
        vo1.setUrl("http://www.wawechat.siemens.com.cn/Home/Product/ssy_product");
        vo1.setKey("V1_TODAY_MUSIC");
        btn.add(vo1);
        ButtonVO vo2 = new ButtonVO();
        vo2.setName("汇迈电器");
        vo2.setType("view");
        vo2.setUrl("http://www.wawechat.siemens.com.cn/Home/Product/ssy_product");
        vo2.setKey("V2_TODAY_MUSIC");
        btn.add(vo2);

        ButtonVO vo3 = new ButtonVO();
        vo3.setName("我");


        List<ButtonVO> list = new ArrayList<>();

        ButtonVO vo31 = new ButtonVO();
        vo31.setType("view");
        vo31.setUrl("http://yichanghuimai.nat300.top/admin");
        vo31.setName("用户中心");
        vo31.setKey("2343234");
        list.add(vo31);
        ButtonVO vo32 = new ButtonVO();
        vo32.setType("view");
        vo32.setUrl("http://www.wawechat.siemens.com.cn/Home/Product/ssy_product");
        vo32.setName("二维码");
        vo32.setKey("2343434");
        list.add(vo32);

        ButtonVO vo33 = new ButtonVO();
        vo33.setType("view");
        vo33.setUrl("http://www.wawechat.siemens.com.cn/Home/Product/ssy_product");
        vo33.setName("关于我们");
        vo33.setKey("2343334");
        list.add(vo33);
        btn.add(vo3);
        vo3.setSub_button(list);
        vo.setButton(btn);
        String a = JSON.toJSONString(vo);
        return HttpUtil.sendPost(CREATE_MENU.replace("ACCESS_TOKEN", accessTokena), a);
    }

    public static void main(String[] args) {
        String accessToken = getAccessToken();
        String s = createMenu(accessToken);
        System.out.println(s);
    }


}
