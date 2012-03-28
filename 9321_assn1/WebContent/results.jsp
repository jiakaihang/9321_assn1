<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="edu.unsw.comp9321.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="search" class="edu.unsw.comp9321.ControlServlet" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MUniverse Search Result</title>
</head>
<body>
    <center>
    	<form action='checkout.jsp' method='POST'>
			<h2 align=center style="font-family: sans-serif; color: red;">
			<% 
			int a = ((Map<String,String>) request.getSession().getAttribute("albumMap")).size();
			int b = ((Map<String,String>) request.getSession().getAttribute("songMap")).size();
			int sum = a+b;
			if(sum>1)
				out.print("There are " + sum + " result(s) found.");
			else if(sum==1)
				out.print("There is " + sum + " result found.");
			else
				out.print("Sorry, Not found in the database.");
			%>
			</h2>
			<table border=1 align=center>
				<% 
				Map<String,String> albumMap = (Map<String,String>) request.getSession().getAttribute("albumMap");
				Map<Integer,String> aMap = new HashMap<Integer,String>();
				if(albumMap.size()!=0) {
					out.print("<th>Album Title <th>Album Price <th>Buy");
					int i = 1;
					for(String key: albumMap.keySet()){
				    	out.println("<tr BGCOLOR=\"#FFAD00\">");     
					    out.println("<td>"+key+"</td>"); 
					    out.println("<td>"+albumMap.get(key)+"</td>");
						out.println("<td><input type=\"checkbox\" id=\"album\" name=\"albums\" value="+i+"></td>");
				    	out.println("</tr>"); 
				    	aMap.put(i, key);
				    	i++;
					}
					request.getSession().setAttribute("aMap", aMap);
			    }%>
		    </table>
			<br>&nbsp;<br>
		    <table border=1 align=center>
				<% 
				Map<String,String> songMap = (Map<String,String>) request.getSession().getAttribute("songMap");
				Map<Integer,String> sMap = new HashMap<Integer,String>();
				if(songMap.size()!=0) {
					out.print("<th>Song Title <th>Song Price <th>Buy");
					int i = 1;
					for(String key: songMap.keySet()){
				    	out.println("<tr BGCOLOR=\"#FFAD00\">");     
					    out.println("<td>"+key+"</td>"); 
					    out.println("<td>"+songMap.get(key)+"</td>");
						out.println("<td><input type=\"checkbox\" id=\"song\" name=\"songs\" value="+i+"></td>");
				    	out.println("</tr>"); 
				    	sMap.put(i, key);
				    	i++;
					}
					request.getSession().setAttribute("sMap", sMap);
			    }%>
		    </table>
		    <br>
	
			<input type="submit" value="Checkout" style="width:120px;height:30px;
				font-family:sans-serif;font-weight:bold;font-style:italic;">&nbsp;
		</form>
		<br>
		<form action='search.jsp' method='POST'>
			<input type="submit" value="Search Again" style="width:120px;height:30px;
				font-family:sans-serif;font-weight:bold;font-style:italic;">&nbsp;
		</form>
	</center>
</body>
</html>