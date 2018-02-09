<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="Error.jsp"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page session="true" %>
<%
  HttpSession session2 = request.getSession();

  if(null!=session2.getAttribute("username")){ %>


<html class="w-100 h-100">
  <jsp:include page="header.jsp" >
    <jsp:param name="titolo" value="Benvenuto" />
  </jsp:include>
    <body>
      <body class="w-100 h-100 text-center">
      <div class="d-flex justify-content-center w-100 h-100">
        <div class="align-self-center">
          <h1>
            <%
            String nome=session.getAttribute("username").toString();
            out.println("Benvenuto "+ nome);
            %>
          </h1>
          <h1 class="btn btn-secondary mb-0">
            <%
              try {
                String connectionURL = "jdbc:mysql://localhost:3306/loginJsp";
                Connection connection = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL, "root", "");

                String query = "SELECT ruolo from ruoli WHERE idRuolo = '" + session.getAttribute("ruolo").toString() +"'";
                Statement stmt = null;

                try {
                    stmt = connection.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    rs.beforeFirst();

                    if (!rs.next())
                      response.sendRedirect("Error.jsp");
                    else
                      out.println("<strong>Ruolo: </strong>" + rs.getString("ruolo") + "");
                  } catch (SQLException e ) {
                  } finally {
                    if (stmt != null) { stmt.close(); }
                  }
                connection.close();
              }catch(Exception ex){
                out.println("Unable to connect to database.");
              }  %>
          </h1>
          <a href="Logout.jsp" class="btn btn-danger">Esci</a>
        </div>
      </div>
      <%@ include file="script.html" %>
    </body>
</html>

<%
  }
  else{
    response.sendRedirect("Login.jsp");
  }
%>
