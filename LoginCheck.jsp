<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
		try {
			String connectionURL = "jdbc:mysql://localhost:3306/loginJsp";
			Connection connection = null; 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			connection = DriverManager.getConnection(connectionURL, "root", "");
			if(!connection.isClosed())
				 out.println("Successfully connected to " + "MySQL server using TCP/IP...");
			connection.close();
		}catch(Exception ex){
			out.println("Unable to connect to database.");
		}
		
        %>
    </body>
</html>