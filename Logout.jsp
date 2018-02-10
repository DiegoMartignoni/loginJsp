<%
  session.removeAttribute("username");
  session.removeAttribute("password");
  session.removeAttribute("ruolo");
  session.invalidate();
  response.sendRedirect("index.jsp");
%>
