package edu.unsw.comp9321;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
public class ShoppingList implements Serializable{
	
	//public enum type {album, song}
	
	private Map<String, Double> albums;
	private Map<String, Double> songs;
	
	private static final long serialVersionUID = 1L;
	
	public ShoppingList(){
		albums = new HashMap<String, Double>();
		songs = new HashMap<String, Double>();
	}
	
	public Map<String,Double> getAlbums(){
		return albums;
	}
	
	public Map<String,Double> getSongs(){
		return songs;
	}
	
	public void addAlbum(String name, Double price){
		albums.put(name, price); 
	}
	
	public void addSong(String name, Double price){
		songs.put(name, price);
	}
	
	public void setAlbums(Map<String,Double> albums){
		this.albums = albums;
	}
	
	public void setSongs(Map<String,Double> songs){
		this.songs = songs;
	}

}
