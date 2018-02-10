<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="Error.jsp"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
  HttpSession session2 = request.getSession();
  String ruolo = "";
  Vector<String> nomeUtente = new Vector<String>();
  Vector<String> ruoloUtente = new Vector<String>();
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

        String limite = session.getAttribute("ruolo").toString();
        if(limite.equals("4"))
          limite = "3";
        query = "SELECT utenti.utente, ruoli.ruolo FROM utenti INNER JOIN ruoli ON utenti.idRuolo=ruoli.idRuolo AND utenti.idRuolo > '"+ limite +"';";

        try {
          stmt = connection.createStatement();
          ResultSet rs2 = stmt.executeQuery(query);
          rs2.beforeFirst();

          while (rs2.next()){
            nomeUtente.addElement(rs2.getString("utente"));
            ruoloUtente.addElement(rs2.getString("ruolo"));
          }
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


          <table class="table table-striped mt-3">
            <thead>
              <tr class="bg-primary text-white rounded">
                <th scope="col">#</th>
                <th scope="col">Utente</th>
                <th scope="col">Ruolo</th>
                <%
                  if(session.getAttribute("ruolo").equals(1)){
                    out.println("<th scope='col'>Operazioni</th>");
                  }
                %>
              </tr>
            </thead>
            <tbody>
              <%
              int i = 1;
              Enumeration n = nomeUtente.elements();
              Enumeration r = ruoloUtente.elements();
              while(n.hasMoreElements()){
              %>

              <tr>
                <th scope="row"><% out.print(i++); %></th>
                <td><% out.print(n.nextElement()); %></td>
                <td><% out.print(r.nextElement()); %></td>

                <% if(session.getAttribute("ruolo").equals(1)){
                %>
                <td><a href="index.jsp" class="btn btn-danger">Elimina</a></td>
                <% } %>

              </tr>
              <% } %>
            </tbody>
          </table>



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
