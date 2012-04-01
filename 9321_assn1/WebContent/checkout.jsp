<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="edu.unsw.comp9321.*, java.util.*,java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="search" class="edu.unsw.comp9321.ControlServlet" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Check-Out!</title>
	</head>	
	<body background="Imgs/BGImg1.jpg"style="background-repeat: no-repeat;background-attachment: scroll;margin: auto;">
		<h2>Shopping List: </h2>
		<center>
		<form action='search.jsp' method='POST'>
			<h3 align=center style="font-family: sans-serif">
			<% 
			Map<String,String> albumMap = (Map<String,String>) request.getSession().getAttribute("albumMap");
			Map<String,String> songMap = (Map<String,String>) request.getSession().getAttribute("songMap");
			
			Map<Integer,String> aMap = (Map<Integer,String>) request.getSession().getAttribute("aMap");
			Map<Integer,String> sMap = (Map<Integer,String>) request.getSession().getAttribute("sMap");

			
			ShoppingList sList = (ShoppingList) request.getSession().getAttribute("sList");
			
			if(sList == null){
				sList = new ShoppingList();
				request.getSession().setAttribute("sList", sList);
			}
			
			String[] selectedSongs = request.getParameterValues("songs");
			String[] selectedAlbums = request.getParameterValues("albums");
			
			double totalPrice = 0;
			
			if(selectedSongs!=null){
				for(String s: selectedSongs){
					String title = sMap.get(Integer.valueOf(s));
					double	price = Double.valueOf(songMap.get(title).substring(1));
					if(!sList.getSongs().containsKey(title))
						sList.addSong(title, price);			
				}
			}
			if(selectedAlbums!=null){
				for(String s: selectedAlbums){
					String title = aMap.get(Integer.valueOf(s));
					double	price = Double.valueOf(albumMap.get(title).substring(1));
					if(!sList.getAlbums().containsKey(title))
						sList.addAlbum(title, price);
				}
			}
			
			out.println("<table border=1 align=center>");
			if(sList.getAlbums().size()!=0) {
				out.print("<th>Album Title <th>Album Price");
				for(String key: sList.getAlbums().keySet()){
			    	out.println("<tr BGCOLOR=\"#FFAD00\">");     
				    out.println("<td>"+key+" </td>"); 
				    out.println("<td>$"+sList.getAlbums().get(key)+"</td>");
			    	out.println("</tr>"); 
			    	totalPrice += Double.valueOf(sList.getAlbums().get(key));
				}
			}
			out.println("</table>\n<br>");

			out.println("<table border=1 align=center>");
			if(sList.getSongs().size()!=0) {
				out.print("<th>Song Title <th>Song Price");
				for(String key: sList.getSongs().keySet()){
			    	out.println("<tr BGCOLOR=\"#FFAD00\">");     
				    out.println("<td>"+key+" </td>"); 
				    out.println("<td>$"+sList.getSongs().get(key)+"</td>");
			    	out.println("</tr>"); 
			    	totalPrice += Double.valueOf(sList.getSongs().get(key));
				}
			}
			out.println("</table>");
			DecimalFormat df=new DecimalFormat("#.00");
			out.println("<h2>The total Price is: $"+df.format(totalPrice)+"</h2>");
			request.getSession().setAttribute("total", totalPrice);
			
			%>
			<label>Finish Searching?</label><br>
			<input type="submit" value="Not yet!" style="width:120px;height:30px;
				font-family:sans-serif;font-weight:bold;font-style:italic;">&nbsp;
			</h3>
			</form>
			</center>

			<center>
			<form action='done.jsp' method="post">
			<input type="submit" value="Pay" style="width:120px;height:30px;
				font-family:sans-serif;font-weight:bold;font-style:italic;">&nbsp;
			</form>
			</center>
			
	</body>
</html>