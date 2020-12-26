package com.jadmin.util;

import cn.hutool.core.io.FileUtil;
import cn.hutool.extra.qrcode.QrCodeUtil;
import cn.hutool.extra.qrcode.QrConfig;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.zxing.EncodeHintType;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 * @Description: java类作用描述
 * @Author: dongzhou
 * @CreateDate: 2020/12/26 16:21
 */
public class QRCodeUtil {

    public static String  createQrcode(String content) {
        QrConfig config = new QrConfig(300, 300);
        config.setImg("C:/Users/49422/Desktop/logo_small.jpg");

        BufferedImage s=    QrCodeUtil.generate(content,config);
        return  null;
    }

    public static void main(String[] args) {
        createQrcode("生成二维码");
    }
}
