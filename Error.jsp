<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html class="w-100 h-100">
    <jsp:include page="header.jsp" >
      <jsp:param name="titolo" value="Disconnessione" />
    </jsp:include>
    <body class="w-100 h-100">
  		<div class="d-flex justify-content-center w-100 h-100">
  			<div class="align-self-center">
          <h1>Ops, qualcosa è andato storto :(</h1>
          <a href="index.jsp" class="btn btn-warning">Riprova</a>
        </div>
      </div>
      <%@ include file="script.html" %>
    </body>
</html>
