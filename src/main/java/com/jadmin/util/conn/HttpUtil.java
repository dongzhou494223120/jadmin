package com.jadmin.util.conn;


import com.alibaba.fastjson.JSON;
import com.jadmin.vo.entity.WeChatVO.WeChatResultDTO;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

/**
 * http请求工具类
 */
public class HttpUtil {

    /**
     * post
     *
     * @param url
     * @param
     * @return
     */
    public static String sendPost(String url,String  param) {
        String result = "";
        BufferedReader in = null;
        PrintWriter out = null;
        try {
            URL realUrl = new URL(url);
            URLConnection connection = realUrl.openConnection();
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            connection.setRequestProperty("Charset", "UTF-8");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            out = new PrintWriter(connection.getOutputStream());
//            String param = "";
//            if (paramMap != null && paramMap.size() > 0) {
//                Iterator<String> ite = paramMap.keySet().iterator();
//                while (ite.hasNext()) {
//                    String key = ite.next();// key
//                    String value = paramMap.get(key);
//                    param += key + "=" + value + "&";
//                }
//                param = param.substring(0, param.length() - 1);
//            }
            System.out.println(param);
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.err.println("发送 POST 请求出现异常！" + e);
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    /**
     * Get方法
     */

    public static WeChatResultDTO sendGet(String uri) {
        StringBuilder result = new StringBuilder();
        try {
            URL url = new URL(uri);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setDoOutput(true); // 设置该连接是可以输出的
            connection.setRequestMethod("GET"); // 设置请求方式
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
            String line = null;

            while ((line = br.readLine()) != null) { // 读取数据
                result.append(line + "\n");
            }
            connection.disconnect();
            System.out.println(result.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }
        if (null != result.toString()) {
            return JSON.parseObject(result.toString(), WeChatResultDTO.class);
        }
        return null;
    }
}
