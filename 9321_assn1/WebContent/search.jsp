<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="edu.unsw.comp9321.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="search" class="edu.unsw.comp9321.ControlServlet" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>MUsic Search</title>
	</head>
	<body background="Imgs/BGImg1.jpg"style="background-repeat: no-repeat;background-attachment: scroll;margin: auto;">
	<br>&nbsp;<br>
	<br>&nbsp;<br>
		<center>
			<h1 style="font-family: times; color: red;">MUniverse Search</h1>
			<br>&nbsp;<br>
			<form action="ControlServlet" method="post">
			<table>
				<tr>
					<td>
						<label for="searchType">Albums</label>
						<input type="radio" id="albums" name="searchType" value="albums" checked="checked">
						<label for="searchType">Songs</label>
						<input type="radio" id="songs" name="searchType" value="songs">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label for="searchBy">Artist</label>
						<input type="radio" id="artist" name="searchBy" value="artist" checked="checked">
						<label for="searchBy">Year</label>
						<input type="radio" id="year" name="searchBy" value="year">
						<label for="searchType">Genre</label>
						<input type="radio" id="genre" name="searchBy" value="genre">
					</td>
				</tr>
				<tr>
					<td><input type="text" name="searchCode" style="width:380px;height:30px;
						font-family:sans-serif;font-size:16px;font-weight:bold;border:solid 1px #6DB72C;"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Search" style="width:100px;height:30px;
						font-family:sans-serif;font-weight:bold;font-style:italic;">&nbsp;
					</td>
				</tr>
			</table>
			</form>
		</center>
	</body>
</html>