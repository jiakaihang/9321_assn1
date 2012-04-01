<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="edu.unsw.comp9321.*, java.util.*,java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="search" class="edu.unsw.comp9321.ControlServlet" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank you!!!</title>
</head>
	<body background="Imgs/BGImg1.jpg"style="background-repeat: no-repeat;background-attachment: scroll;margin: auto;">
	<% ShoppingList sList = (ShoppingList) request.getSession().getAttribute("sList");
	if(sList!=null){
		 Map<String, Double> albums = sList.getAlbums();
		 Map<String, Double> songs = sList.getSongs();
	%>
	<h1 style="font-family: verdana">Thank you for shopping at MUniverse!!!</h1>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	<h1 style="font-family: Time" align="center">Here is your shopping list:</h1>
		<%if(albums.size()>0){ %>
			<TABLE BORDER="1" align="center" bgcolor="#E8FDFF">
				<TH>Albums</TH><TH>Price</TH>
				<% for (String name: albums.keySet()) { %>
					<TR BGCOLOR="#FFAD00">
						<TD><font color="black"><%= name%></font></TD>
						<TD><font color="red">$<%= albums.get(name)%></font></TD>
					</TR>
				<% } %>
		    </TABLE>
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<%} %>
		<%if(songs.size()>0){ %>
			<TABLE BORDER="1" align="center" bgcolor="#E8FDFF">
				<TH>Songs</TH><TH>Price</TH>
				<% for (String name: songs.keySet()) { %>
					<TR BGCOLOR="#FFAD00">
						<TD><font color="black"><%= name%></font></TD>
						<TD><font color="red">$<%= songs.get(name)%></font></TD>
					</TR>
				<% } %>
		    </TABLE>
		<%} 
	double total = (Double) request.getSession().getAttribute("total"); 
	DecimalFormat df=new DecimalFormat("#.00");
	%>
	<h1 style="font-family: Time" align = "center">Price paid in total: <font color="red">$<%= df.format(total)%></font></h1>
	<%}else{ %> 
			<form action='search.jsp' method="post">Session Expired
			<input type="submit" value="Search Again" style="width:120px;height:30px;
				font-family:sans-serif;font-weight:bold;font-style:italic;">&nbsp;
			</form>
	
	<%} %>
	    
	    
	    
	<%request.getSession().invalidate(); %>
	   
</body>
</html>