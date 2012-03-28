package edu.unsw.comp9321;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;

import org.eclipse.jdt.internal.compiler.batch.Main;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import java.io.File;
import java.io.InputStream;

import java.io.InputStream;

/**
 * Servlet implementation class ControlServlet
 */
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Map<String,String> albumMap;
    public Map<String,String> songMap;
    public ShoppingList sList;
    private final static String DBPath = "C:\\Users\\Kaihang\\JavaWorkspace\\comp9321\\9321_assn1\\WebContent\\musicDB.xml";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlServlet() {
        super();
        sList = new ShoppingList(); 
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	} 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        albumMap = new HashMap<String, String>();
        songMap = new HashMap<String, String>();
        sList = (ShoppingList)request.getSession().getAttribute("sList");
		String searchType = request.getParameterValues("searchType")[0];
		String searchBy = request.getParameterValues("searchBy")[0];	//only 1 value returns
		String searchCode = request.getParameterValues("searchCode")[0];
		search(searchType, searchBy, searchCode);
		request.getSession().setAttribute("albumMap", albumMap);
		request.getSession().setAttribute("songMap", songMap); 
		request.getSession().setAttribute("sList", sList);
		RequestDispatcher rd = request.getRequestDispatcher("/results.jsp");
		rd.forward(request, response); 
	}	

	private void search(String searchType, String searchBy, String searchCode) {
		try{
			File fXmlFile = new File(DBPath);
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(fXmlFile);
			doc.getDocumentElement().normalize();

			NodeList aList = doc.getElementsByTagName("Album");	
			for (int j = 0; j < aList.getLength(); j++) {
				boolean isEqual = false;
				 
				Node aNode = aList.item(j);
				if (aNode.getNodeType() == Node.ELEMENT_NODE) {
		 
					Element eElement = (Element) aNode;
				    if(searchBy.compareTo("artist")==0){ //search by artist
				    	if(searchCode.toLowerCase().compareTo(getTagValue("AlbumArtist",eElement).toLowerCase())==0){
				    		System.out.println("searchCode is: "+searchCode);
				    		System.out.println("AlbumArtist is: "+getTagValue("AlbumArtist",eElement));
				    		isEqual = true;
				    	}
				    }
				    else if(searchBy.compareTo("year")==0){ //search by year
				    	if(searchCode.compareTo(getTagValue("Year",eElement))==0)
				    		isEqual = true;
				    }
				    else{ //search by genre
				    	if(searchCode.compareTo(getTagValue("Genre",eElement))==0)
				    		isEqual = true;
				    }
		 
				    if(searchType.compareTo("albums")==0 && isEqual == true){
				    	System.out.println("searchType is : " + searchType);
				    	albumMap.put(getTagValue("AlbumTitle",eElement), "$"+getTagValue("AlbumPrice",eElement));
				    }
				    else if(searchType.compareTo("songs")==0 && isEqual==true){
				    	System.out.println("searchType is : " + searchType);
				    	NodeList sList = eElement.getElementsByTagName("Song");
				    	for(int i = 0; i<sList.getLength(); i++){
				    		Node sNode = sList.item(i);
				    		if(sNode.getNodeType() == Node.ELEMENT_NODE){
				    			Element eeElement = (Element) sNode;
				    			songMap.put(getTagValue("SongTitle",eeElement), "$"+getTagValue("SongPrice",eeElement));
				    		}
				    	 }
				      }
				   }
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
    
	private static String getTagValue(String sTag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(sTag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		return nValue.getNodeValue();
	}

}
