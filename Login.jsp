<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html class="w-100 h-100">
    <jsp:include page="header.jsp" >
      <jsp:param name="titolo" value="Accedi" />
    </jsp:include>
    <body class="w-100 h-100">
		<div class="d-flex justify-content-center w-100 h-100">
			<div class="align-self-center">
				<h1 class="mb-2">Login Page</h1>
				<form action="LoginCheck.jsp" method="post" class="form-group mb-1">
					<input type="text" name="username" placeholder="Inserisci email" class="form-control mb-1">
					<input type="password" name="password" placeholder="Password" class="form-control mb-2">
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
		<%@ include file="script.html" %>
    </body>
</html>
