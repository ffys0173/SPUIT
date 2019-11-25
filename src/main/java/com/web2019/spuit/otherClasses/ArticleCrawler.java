package com.web2019.spuit.otherClasses;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.ArrayList;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ArticleCrawler {
	
	private ArrayList<ArticleThread> articleThread;
    private final static String USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36";

    // SSL
    public static void setSSL() throws NoSuchAlgorithmException, KeyManagementException {
        TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
            public X509Certificate[] getAcceptedIssuers() {
                return null;
            }

            public void checkClientTrusted(X509Certificate[] certs, String authType) {
            }

            public void checkServerTrusted(X509Certificate[] certs, String authType) {
            }
        } };
        SSLContext sc = SSLContext.getInstance("SSL");
        sc.init(null, trustAllCerts, new SecureRandom());
        HttpsURLConnection.setDefaultHostnameVerifier(
            new HostnameVerifier() {
                @Override
                public boolean verify(String hostname, SSLSession session) {
                    return true;
                }
            }
        );
        HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
    }
    
    public ArrayList<ArticleThread> getListofArticle(String uid_no){
    	
    	ArrayList<ArticleThread> loat = new ArrayList<ArticleThread>();
    	
    	try {
            // URL def
            String connUrl = "http://search.imnews.imbc.com:8180/news/search.jsp?kwd=°Ë»ö";
            // SSL chk
            try {
                if(connUrl.indexOf("https://") >= 0){
                    ArticleCrawler.setSSL();
                }
            } catch (Exception e) {
               
            }

            // HTML get
            Connection conn = Jsoup
                    .connect(connUrl)
                    .header("Content-Type", "application/json;charset=UTF-8")
                    .userAgent(USER_AGENT)
                    .method(Connection.Method.GET)
                    .ignoreContentType(true);

            //select
            Document doc = conn.get();
            Elements list = doc.select("ul.searchresult_list").select("li");
            
            for(Element e : list) {
            	ArticleThread at = new ArticleThread();
            	
            	at.setArticleTitle(e.select("span.title").text());
            	at.setArticleContent(e.select("span.description").text());
            	at.setArticleThumbnail(e.select("img.thum_img").attr("src"));
            	at.setArticleUrl(e.select("a").attr("href"));
            	
            	loat.add(at);
            }
    	}
    	catch (IOException e) {
    		
    	}
    	
    	
		/*
		 * loat.add(getArticle(
		 * "http://imnews.imbc.com/replay/2019/nwtoday/article/5617981_24616.html?menuid=culture"
		 * )); loat.add(getArticle(
		 * "http://imnews.imbc.com/replay/2019/nw1400/article/5619983_24623.html?menuid=society"
		 * )); loat.add(getArticle(
		 * "http://imnews.imbc.com/news/2019/society/article/5620133_24698.html?menuid=society"
		 * ));
		 */
    	
    	return loat;
    }

    public ArticleThread getArticle(String url) {
        try {
            // URL def
            String connUrl = url;
            // SSL chk
            try {
                if(connUrl.indexOf("https://") >= 0){
                    ArticleCrawler.setSSL();
                }
            } catch (Exception e) {
               
            }

            // HTML get
            Connection conn = Jsoup
                    .connect(connUrl)
                    .header("Content-Type", "application/json;charset=UTF-8")
                    .userAgent(USER_AGENT)
                    .method(Connection.Method.GET)
                    .ignoreContentType(true);

            //select
            Document doc = conn.get();
            Elements element = doc.select("section.cont");
            
            ArticleThread article = new ArticleThread();
            article.setArticleTitle(element.select("h1.title").text());
            article.setArticleContent(element.select("section.txt").text());
            article.setArticleThumbnail(element.select("img").get(0).attr("src"));
            
            return article;

        } catch (IOException e) {
            // Exp : Connection Fail
            e.printStackTrace();
            
            return null;
        }
    }
}