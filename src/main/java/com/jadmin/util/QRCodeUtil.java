package com.jadmin.util;

import cn.hutool.core.io.FileUtil;
import cn.hutool.extra.qrcode.QrCodeUtil;
import cn.hutool.extra.qrcode.QrConfig;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;
import java.awt.*;
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


    //文字显示
    private static final int QRCOLOR = 0x201f1f; // 二维码颜色:黑色
    private static final int BGWHITE = 0xFFFFFF; //二维码背景颜色:白色

    // 设置QR二维码参数信息
    private static Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>() {
        private static final long serialVersionUID = 1L;
        {
            put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);// 设置QR二维码的纠错级别(H为最高级别)
            put(EncodeHintType.CHARACTER_SET, "utf-8");// 设置编码方式
            put(EncodeHintType.MARGIN, 0);// 白边
        }
    };

    /**
     * 生成二维码图片+背景+文字描述
     * @param codeFile 生成图地址
     * @param bgImgFile 背景图地址
     * @param WIDTH 二维码宽度
     * @param HEIGHT 二维码高度
     * @param qrUrl 二维码识别地址
     * @param note  文字描述1
     * @param tui   文字描述2
     * @param size 文字大小
     * @param imagesX 二维码x轴方向
     * @param imagesY 二维码y轴方向
     * @param text1X 文字描述1x轴方向
     * @param text1Y 文字描述1y轴方向
     * @param text2X 文字描述2x轴方向
     * @param text2Y 文字描述2y轴方向
     */
    public static void CreatQRCode( File codeFile, File bgImgFile,Integer WIDTH,Integer HEIGHT,String qrUrl,
                                    String note,String tui,Integer size,Integer imagesX,Integer imagesY,Integer text1X,Integer text1Y
            ,Integer text2X,Integer text2Y) {
        try {
            MultiFormatWriter multiFormatWriter = new MultiFormatWriter();
            // 参数顺序分别为: 编码内容,编码类型,生成图片宽度,生成图片高度,设置参数
            BitMatrix bm = multiFormatWriter.encode(qrUrl, BarcodeFormat.QR_CODE, WIDTH, HEIGHT, hints);
            BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);

            // 开始利用二维码数据创建Bitmap图片，分别设为黑(0xFFFFFFFF) 白(0xFF000000)两色
            for (int x = 0; x < WIDTH; x++) {
                for (int y = 0; y < HEIGHT; y++) {
                    image.setRGB(x, y, bm.get(x, y) ? QRCOLOR : BGWHITE);
                }
            }

            /*
             * 	添加背景图片
             */
            BufferedImage backgroundImage = ImageIO.read(bgImgFile);
            int bgWidth=backgroundImage.getWidth();
            int qrWidth=image.getWidth();
            //距离背景图片x边的距离，居中显示
            int disx=(bgWidth-qrWidth)-imagesX;
            //距离y边距离 * * * *
            int disy=imagesY;
            Graphics2D rng=backgroundImage.createGraphics();
            rng.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP));
            rng.drawImage(image,disx,disy,WIDTH,HEIGHT,null);

            /*
             * 	文字描述参数设置
             */

            Color textColor=Color.white;
            rng.setColor(textColor);
            rng.drawImage(backgroundImage,0,0,null);
            //设置字体类型和大小(BOLD加粗/ PLAIN平常)
            rng.setFont(new Font("微软雅黑,Arial",Font.BOLD,size));
            //设置字体颜色
            rng.setColor(Color.black);
            int strWidth=rng.getFontMetrics().stringWidth(note);

            //文字1显示位置
            int disx1=(bgWidth-strWidth)-text1X;//左右
            rng.drawString(note,disx1,text1Y);//上下

            //文字2显示位置
            int disx2=(bgWidth-strWidth)-text2X;//左右
            rng.drawString(tui,disx2,text2Y);//上下

            rng.dispose();
            image=backgroundImage;
            image.flush();
            ImageIO.write(image, "png", codeFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    public static void main(String[] args) {
//        createQrcode("生成二维码");
        File bgImgFile=new File("C:/Users/49422/Desktop/44444444444.png");//背景图片
        File QrCodeFile = new File("C:/Users/49422/Desktop/myqrcode.png");//生成图片位置
        String url = "https://blog.csdn.net/weixin_38407595";//二维码链接
        String note = "" ;//文字描述
        String tui = "" ;//文字描述


        //宣传二维码生成
        //生成图地址,背景图地址,二维码宽度,二维码高度,二维码识别地址,文字描述1,文字描述2,文字大小,图片x轴方向,图片y轴方向,文字1||2xy轴方向
        CreatQRCode(QrCodeFile,bgImgFile, 148, 148, url, note,tui, 38, 408, 123, 0, 0, 410, 210);
    }
}
