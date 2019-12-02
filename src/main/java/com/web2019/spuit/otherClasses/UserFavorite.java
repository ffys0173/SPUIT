package com.web2019.spuit.otherClasses;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;

public class UserFavorite {
	
	private String idno;
	private String prefix;
	private HashMap<String, Integer> favoriteMap;
	
	public UserFavorite(String idno) {
		this.prefix = "";
		this.idno = idno;
		this.favoriteMap = new HashMap<String, Integer>();
	}
	
	public void setFavoriteMap(HashMap<String, Integer> favoriteMap) {
		this.favoriteMap = favoriteMap;
	}

	public HashMap<String, Integer> getFavoriteMap(){
		
		return this.favoriteMap;
	}
	
	public void addFavorite(String favorite, int time) {
		
		favoriteMap.put(favorite, time);
	}

	public void WriteFile() throws IOException {
		
		FileOutputStream fileStream = new FileOutputStream(prefix + idno + ".txt");
		ObjectOutputStream objectOutputStream = new ObjectOutputStream(fileStream);
		
		objectOutputStream.writeObject(favoriteMap);
		objectOutputStream.close();
		
	}
	
	public void ReadFile() throws Exception {
		
		FileInputStream fileStream = new FileInputStream(prefix + idno+".txt");
		ObjectInputStream objectInputStream = new ObjectInputStream(fileStream);
		
		Object object = objectInputStream.readObject();  
		objectInputStream.close();
		
		favoriteMap = (HashMap)object;
		
	}
}