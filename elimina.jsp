<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="Error.jsp"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
try {
  String connectionURL = "jdbc:mysql://localhost:3306/loginJsp";
  Connection connection = null;
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  connection = DriverManager.getConnection(connectionURL, "root", "");

  if(request.getParameter("elimina")!=null){
    out.println("fatto");
    String testaNome = "SELECT * from utenti WHERE idUtente = " + request.getParameter("elimina").toString();
    out.println(testaNome);
    Statement stmt = null;
    try {
      stmt = connection.createStatement();
      ResultSet rs3 = stmt.executeQuery(testaNome);
      rs3.beforeFirst();
      if (!rs3.next()) {
         out.println("Non trovato"); //CHECK
      } else{
        out.println("Trovato");
        String eliminaQuery = "DELETE FROM utenti WHERE idUtente = "+ request.getParameter("elimina").toString();
        out.println(eliminaQuery);
        Statement stmt2 = null;
        try {
          out.println("tra poco...");
          stmt2 = connection.createStatement();
          int rs4 = stmt2.executeUpdate(eliminaQuery);
          out.println("eliminata");
          response.sendRedirect("index.jsp");
        } catch (SQLException e ) {
          out.println(e);
        } finally {
          if (stmt != null) { stmt2.close(); }
        }
      }
    } catch (SQLException e ) {
    } finally {
      if (stmt != null) { stmt.close(); }
    }
  }
  connection.close();


}catch(Exception ex){
  out.println("Unable to connect to database.");
}
%>
