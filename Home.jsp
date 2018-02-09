<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="Error.jsp"%>
<html class="w-100 h-100">
  <jsp:include page="header.jsp" >
    <jsp:param name="titolo" value="Benvenuto" />
  </jsp:include>
    <body>
      <body class="w-100 h-100">
      <div class="d-flex justify-content-center w-100 h-100">
        <div class="align-self-center">
          <h1>
            <%
            String a=session.getAttribute("username").toString();
            out.println("Hello  "+a);
            %>
          </h1>
          <a href="Logout.jsp" class="btn btn-danger">Logout</a>
        </div>
      </div>
    </body>
</html>
