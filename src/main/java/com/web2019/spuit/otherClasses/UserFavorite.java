package com.web2019.spuit.otherClasses;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import com.web2019.spuit.dto.KeywordVO;

public class UserFavorite {
	
	private String idno;
	private String prefix;
	private HashMap<String, Integer> hashMap;
	
	public UserFavorite(String idno) {
		this.prefix = "";
		this.idno = idno;
		this.hashMap = new HashMap<String, Integer>();
	}
	
	public void setFavoriteMap(List<KeywordVO> lok) {

		for(KeywordVO key : lok) {
			hashMap.put(key.getKeyword(), key.getValue());
		}
		
	}

	public ArrayList<KeywordVO> getFavoriteMap(){
		
		ArrayList<KeywordVO> lok = new ArrayList<KeywordVO>();
		
		lok.sort(new Comparator<KeywordVO>() {
			@Override
			public int compare(KeywordVO o1, KeywordVO o2) {
				int val1 = o1.getValue();
				int val2 = o2.getValue();
				if(val1 == val2) return 0;
				else if(val1 > val2) return 1;
				else return -1;
			}
    	});
		
		for(Entry<String, Integer> entry : hashMap.entrySet()) {
			 lok.add(new KeywordVO(entry.getKey(), entry.getValue())); 
		}
		
		return lok;
	}
	
	public void addFavorite(String keyword, int value) {
		
		hashMap.put(keyword, value);
	}

	public void WriteFile() {
		
		try {
			FileOutputStream fileStream = new FileOutputStream(prefix + idno + ".txt");
			ObjectOutputStream objectOutputStream = new ObjectOutputStream(fileStream);
			
			objectOutputStream.writeObject(hashMap);
			objectOutputStream.close();
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
	}
	
	public void ReadFile() throws IOException, ClassNotFoundException {
		
		try {
			FileInputStream fileStream = new FileInputStream(prefix + idno+".txt");
			ObjectInputStream objectInputStream = new ObjectInputStream(fileStream);
			
			
			Object object = objectInputStream.readObject();  
			objectInputStream.close();

			hashMap = (HashMap)object;
			
		}
		catch(IOException e) {

			WriteFile();
		}
		
		
	}
}