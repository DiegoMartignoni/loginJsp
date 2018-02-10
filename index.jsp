<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="Error.jsp"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page session="true" %>
<%
  HttpSession session2 = request.getSession();
  String ruolo = "";
  String[] idruolo = new String[50];
  int i = 0;
  String[] nome = new String[50];
  if(null!=session2.getAttribute("username")){
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
            ruolo = "<strong>Ruolo: </strong> " + rs.getString("ruolo").toString();

        } catch (SQLException e ) {
        } finally {
          if (stmt != null) { stmt.close(); }
        }

        query = "SELECT utente, ruolo FORM utenti";
        try {
            stmt = connection.createStatement();
            ResultSet rs2 = stmt.executeQuery(query);
            rs2.beforeFirst();

            while (!rs2.next()){
              nome[i] = rs.getString("utente").toString();
              idruolo[i] = rs.getInt("idRuolo").toString();
              i++;
            }
            i=0;

          } catch (SQLException e ) {
          } finally {
            if (stmt != null) { stmt.close(); }
          }


      connection.close();
    }catch(Exception ex){
      out.println("Unable to connect to database.");
    }
%>

<html class="w-100 h-100">
  <jsp:include page="header.jsp" >
    <jsp:param name="titolo" value="Benvenuto" />
  </jsp:include>
    <body>
      <body class="w-100 h-100 text-center">
      <div class="d-flex justify-content-center w-100 h-100">
        <div class="align-self-center jumbotron">
          <h1>
            <%
            String nome=session.getAttribute("username").toString();
            out.println("Benvenuto "+ nome);
            %>
          </h1>
          <h1 class="btn btn-secondary mb-0">
            <% out.println(ruolo); %>
          </h1>
          <a href="Logout.jsp" class="btn btn-danger">Esci</a>
          <%@ include file="tabella.jsp" %>
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
