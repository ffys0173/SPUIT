package com.web2019.spuit.otherClasses;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

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

import com.web2019.spuit.dto.KeywordVO;

public class ArticleCrawler {
	
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
    
    public ArrayList<ArticleThread> getRecent(int offset) {
    	
    	ArrayList<ArticleThread> loat = new ArrayList<ArticleThread>();
    	String connUrl;
    	Connection conn;
    	Elements list;
    	Document doc;
       for(int i=1;i<11;i++) {
	    	//ÇÑ°Ü·Ê
	    	try {
	            // URL def
	            connUrl = "http://www.hani.co.kr/arti/list"+i+".html";
	            // SSL chk
	            try {
	                if(connUrl.indexOf("https://") >= 0){
	                    ArticleCrawler.setSSL();
	                }
	            } catch (Exception e) {
	               
	            }
	
	            // HTML get
	            conn = Jsoup
	                    .connect(connUrl)
	                    .header("Content-Type", "application/json;charset=UTF-8")
	                    .userAgent(USER_AGENT)
	                    .method(Connection.Method.GET)
	                    .ignoreContentType(true);
	
	            //select
	            doc = conn.get();
	            list = doc.select("div.article-area");
	            for(Element e : list) {
	        		ArticleThread at = new ArticleThread();
	        		Date date = new Date();
	        		at.setArticleCategory(e.select("strong.category").text()); 
	        		at.setArticleTitle(e.select("h4.article-title").text());
	        		at.setArticleContent(e.select("p.article-prologue").text());
	        		at.setArticleThumbnail(e.select("span.article-photo").select("img").attr("src"));
	        		at.setArticleUrl("http://www.hani.co.kr" + e.select("h4.article-title").select("a").attr("href"));
	        		at.setArticleTag(at.getArticleCategory());
	        		at.setArticleRegisted(parse(e.select("span.date").text()));
	        		loat.add(at);
	        	}
	    	}
	    	catch (IOException e) {
	    		
	    	}
        }
    	if(loat.size() > offset * 10 + 10) {
    		loat = new ArrayList<ArticleThread>(loat.subList(offset * 10, offset * 10 +10));    		
    	}
    	else {
    		loat = new ArrayList<ArticleThread>(loat.subList(offset * 10, loat.size()));  
    	}
    	return loat;
    }
    
    public ArrayList<ArticleThread> getRecommend(String uid_no, int offset) throws Exception{
    	
    	ArrayList<ArticleThread> loat = new ArrayList<ArticleThread>();
    	

		UserFavorite uf = new UserFavorite(uid_no);
		uf.ReadFile();
		List<KeywordVO> ufk = uf.getFavoriteMap();
		for(KeywordVO key : ufk) {
			loat.addAll(getByKey(key.getKeyword()));
		}
		
		loat.sort(new Comparator<ArticleThread>() {

			@Override
			public int compare(ArticleThread o1, ArticleThread o2) {
				Calendar val1 = o1.getArticleRegisted();
				Calendar val2 = o2.getArticleRegisted();
				return val2.compareTo(val1);
			}
		});
    		
    	if(loat.size() > offset * 10 + 10) {
    		loat = new ArrayList<ArticleThread>(loat.subList(offset * 10, offset * 10 +10));    		
    	}
    	else {
    		loat = new ArrayList<ArticleThread>(loat.subList(offset * 10, loat.size()));  
    	}
    	return loat;
    }
    
	public ArrayList<ArticleThread> getRecommend(ArrayList<KeywordVO> lok, int offset) throws Exception{
	    	
    	ArrayList<ArticleThread> loat = new ArrayList<ArticleThread>();
    	
    	lok.sort(new Comparator<KeywordVO>() {
			@Override
			public int compare(KeywordVO o1, KeywordVO o2) {
				int val1 = o1.getValue();
				int val2 = o2.getValue();
				if(val1 == val2) return 0;
				else if(val1 < val2) return 1;
				else return -1;
			}
    	});
    	
		for(KeywordVO key : lok) {
			loat.addAll(getByKey(key.getKeyword()));
		}
		
		loat.sort(new Comparator<ArticleThread>() {

			@Override
			public int compare(ArticleThread o1, ArticleThread o2) {
				Calendar val1 = o1.getArticleRegisted();
				Calendar val2 = o2.getArticleRegisted();
				return val2.compareTo(val1);
			}
		});
    	
		if(loat.size() > offset * 10 + 10) {
    		loat = new ArrayList<ArticleThread>(loat.subList(offset * 10, offset * 10 +10));    		
    	}
    	else {
    		loat = new ArrayList<ArticleThread>(loat.subList(offset * 10, loat.size()));  
    	}
    	return loat;
    }

    public ArrayList<ArticleThread> getByKey(String key) {
    	
    	ArrayList<ArticleThread> loat = new ArrayList<ArticleThread>();
        
    	//imbc  "http://search.imnews.imbc.com:8180/news/search.jsp?kwd=" + key;
    	try {
            // URL def
            String connUrl = "http://search.hani.co.kr/Search";
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
                    .method(Connection.Method.POST)
                    .ignoreContentType(true)
                    .data("commend", "query")
                    .data("media", "news")
                    .data("keyword", key);

            //select
            Document doc = conn.get();
            Elements list = doc.select("ul.search-result-list").select("li");
            
            for(Element e : list) {
            	ArticleThread at = new ArticleThread();
            	
            	at.setArticleTitle(e.select("dt").text());
            	at.setArticleContent(e.select("dd.detail").text());
            	at.setArticleThumbnail(e.select("dd.photo").select("img").attr("src"));
            	at.setArticleUrl(e.select("dt").select("a").attr("href"));
            	at.setArticleRegisted(parse(e.select("dd.date").text()));
            	at.setArticleTag(key);
            	loat.add(at);
            }
    	}
    	catch (IOException e) {
    		
    	}

    	return loat;
    }
    
    public Calendar parse(String str) {

    	str = str.replace('.', '-');
    	String date = str.split(" ")[0];
    	String time = str.split(" ")[1];
    	Calendar regdate = Calendar.getInstance();
    	
    	regdate.set(
			Integer.parseInt(date.split("-")[0]),
			Integer.parseInt(date.split("-")[1]),
			Integer.parseInt(date.split("-")[2]),
   			Integer.parseInt(time.split(":")[0]),
   			Integer.parseInt(time.split(":")[1])
		);
    	
    	return regdate;
    }
    public ArticleThread getContext(String connUrl) {
    	ArticleThread at = new ArticleThread();
    	//ÇÑ°Ü·Ê
    	try {
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
            at.setArticleTitle(doc.select("div.article-head").select("span.title").text());
        	at.setArticleContent(doc.select("div.article-text").select("div.text").html());
        	at.setArticleThumbnail(doc.select("div.article-text").select("div.image").select("img").attr("src"));
        	at.setArticleRegisted(parse(doc.select("div.article-head").select("p.date-time").select("span").text().substring(4, 20)));
        	
    	}
    	catch (IOException e) {
    		System.out.println("error");
    	}
    	return at;
    }
}