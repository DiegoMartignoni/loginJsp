<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html class="w-100 h-100">
    <jsp:include page="header.jsp" >
      <jsp:param name="titolo" value="Disconnessione" />
    </jsp:include>
    <body class="w-100 h-100">
  		<div class="d-flex justify-content-center w-100 h-100">
  			<div class="align-self-center">
          <%
          session.removeAttribute("username");
          session.removeAttribute("password");
          session.removeAttribute("ruolo");
          session.invalidate();
          %>
          <h1>Disconnessione eseguita.</h1>
        </div>
      </div>
      <%@ include file="script.html" %>
    </body>
</html>
